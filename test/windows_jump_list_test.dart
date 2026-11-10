import 'dart:ui' show Locale;

import 'package:absorb/l10n/app_localizations.dart';
import 'package:absorb/services/windows_jump_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeSource extends ChangeNotifier implements WindowsJumpListSource {
  @override
  bool signedIn = true;
  @override
  JumpListBook? current;
  @override
  List<JumpListBook> continueListening = [];

  void changed() => notifyListeners();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('absorb/windows_jump_list');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  const debounce = Duration(seconds: 3);

  late List<MethodCall> sent;
  late List<String> initialArguments;
  late WindowsJumpList jumpList;
  late _FakeSource source;
  late List<JumpListLaunch> launches;

  setUp(() {
    sent = [];
    initialArguments = [];
    launches = [];
    source = _FakeSource();
    messenger.setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'initialArguments') return initialArguments;
      sent.add(call);
      return true;
    });
    jumpList = WindowsJumpList.withChannel(
      channel,
      debounce: debounce,
      localizations: () async => lookupAppLocalizations(const Locale('en')),
    );
  });

  tearDown(() {
    jumpList.stop();
    messenger.setMockMethodCallHandler(channel, null);
  });

  Future<void> nativeLaunch(List<String> arguments) async {
    final data = const StandardMethodCodec()
        .encodeMethodCall(MethodCall('launch', arguments));
    await messenger.handlePlatformMessage(channel.name, data, (_) {});
  }

  List<MethodCall> updates() =>
      sent.where((c) => c.method == 'update').toList();

  group('JumpListLaunch.parse', () {
    test('reads the item and the resume flag', () {
      expect(JumpListLaunch.parse(['--open-item=li_abc-123']),
          const JumpListLaunch('li_abc-123'));
      expect(JumpListLaunch.parse(['--resume', '--open-item=abc']),
          const JumpListLaunch('abc', resume: true));
    });

    test('ignores other arguments and unsafe or missing ids', () {
      expect(JumpListLaunch.parse(['--minimized']), isNull);
      expect(JumpListLaunch.parse(['--resume']), isNull);
      expect(JumpListLaunch.parse(['--open-item=']), isNull);
      expect(JumpListLaunch.parse(['--open-item=a b']), isNull);
      expect(JumpListLaunch.parse(['--open-item="x" --evil']), isNull);
      expect(JumpListLaunch.parse(['--open-item=https://server/x']), isNull);
      expect(
          JumpListLaunch.parse(['--open-item=${'a' * 129}']), isNull);
      expect(JumpListLaunch.parse(['--probe', '--open-item=id1']),
          const JumpListLaunch('id1'));
    });
  });

  group('JumpListContent', () {
    test('resume is the playing book, the rest skip it and stop at four', () {
      source.current = const JumpListBook('b2', 'Two');
      source.continueListening = [
        for (var i = 1; i <= 7; i++) JumpListBook('b$i', 'Book $i'),
      ];
      final content = JumpListContent.from(source);
      expect(content.resume, const JumpListBook('b2', 'Two'));
      expect(content.recent.map((b) => b.id), ['b1', 'b3', 'b4', 'b5']);
    });

    test('without a playing book the front of the shelf is resumed', () {
      source.continueListening = const [
        JumpListBook('a', 'A'),
        JumpListBook('bad id', 'Skipped'),
        JumpListBook('c', '   '),
        JumpListBook('d', 'D'),
      ];
      final content = JumpListContent.from(source);
      expect(content.resume?.id, 'a');
      expect(content.recent.map((b) => b.id), ['d']);
    });

    test('signed out is empty', () {
      source.signedIn = false;
      source.current = const JumpListBook('a', 'A');
      expect(JumpListContent.from(source).isEmpty, isTrue);
    });
  });

  testWidgets('updates are debounced and only sent when they change',
      (tester) async {
    source.current = const JumpListBook('b1', 'Dune');
    source.continueListening = const [JumpListBook('b2', 'Emma')];
    await jumpList.start(source: source);
    expect(updates(), isEmpty);

    // Player ticks while playing: still one update after the delay.
    for (var i = 0; i < 5; i++) {
      source.changed();
      await tester.pump(const Duration(milliseconds: 500));
    }
    expect(updates(), isEmpty);
    await tester.pump(debounce);
    expect(updates(), hasLength(1));
    final args = updates().single.arguments as Map;
    expect(args['resume'],
        {'id': 'b1', 'title': 'Dune', 'label': 'Resume Dune'});
    expect(args['category'], 'Continue Listening');
    expect(args['recent'], [
      {'id': 'b2', 'title': 'Emma'}
    ]);

    // Nothing changed: nothing sent.
    source.changed();
    await tester.pump(debounce * 2);
    expect(updates(), hasLength(1));

    // A new book: one more update.
    source.current = const JumpListBook('b3', 'Ulysses');
    source.changed();
    await tester.pump(debounce);
    expect(updates(), hasLength(2));
    expect((updates().last.arguments as Map)['resume']['id'], 'b3');
  });

  testWidgets('signing out clears the list at once', (tester) async {
    source.current = const JumpListBook('b1', 'Dune');
    await jumpList.start(source: source);
    await tester.pump(debounce);
    expect(updates(), hasLength(1));

    source.signedIn = false;
    source.changed();
    await tester.pump();
    expect(sent.last.method, 'clear');
    final count = sent.length;

    // Nothing more while signed out, even after the delay.
    source.changed();
    await tester.pump(debounce * 2);
    expect(sent, hasLength(count));

    // Signing in again brings it back.
    source.signedIn = true;
    source.changed();
    await tester.pump(debounce);
    expect(sent.last.method, 'update');
  });

  testWidgets('launch arguments open the book, held until there is a handler',
      (tester) async {
    initialArguments = ['--open-item=b9', '--resume'];
    await jumpList.start(source: source);
    await tester.pump();
    // No handler yet: kept.
    expect(launches, isEmpty);
    await jumpList.start(source: source, onLaunch: launches.add);
    expect(launches, [const JumpListLaunch('b9', resume: true)]);

    // A second launch forwarded by the running copy.
    await nativeLaunch(['--open-item=b4']);
    expect(launches.last, const JumpListLaunch('b4'));

    // Plain relaunches and unsafe ids do nothing.
    await nativeLaunch(['--minimized']);
    await nativeLaunch(['--open-item=a&b']);
    expect(launches, hasLength(2));
    await tester.pump(debounce);
  });

  testWidgets('a launch while signed out waits for sign-in', (tester) async {
    source.signedIn = false;
    await jumpList.start(source: source, onLaunch: launches.add);
    await nativeLaunch(['--open-item=b1']);
    expect(launches, isEmpty);
    source.signedIn = true;
    source.changed();
    expect(launches, [const JumpListLaunch('b1')]);
    await tester.pump(debounce);
  });

  testWidgets('a detached handler gets nothing', (tester) async {
    void handler(JumpListLaunch l) => launches.add(l);
    await jumpList.start(source: source, onLaunch: handler);
    jumpList.detachLaunchHandler(handler);
    await nativeLaunch(['--open-item=b1']);
    expect(launches, isEmpty);
    await tester.pump(debounce);
  });
}
