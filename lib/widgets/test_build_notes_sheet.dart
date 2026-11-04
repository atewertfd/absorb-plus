import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/test_build_notes.dart';

/// Patch notes as a plain bullet list (Absorb Plus Test app).
class TestBuildNoteList extends StatelessWidget {
  const TestBuildNoteList({super.key, required this.notes, this.style});

  final List<String> notes;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final textStyle =
        style ??
        Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final note in notes)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: textStyle),
                Expanded(child: Text(note, style: textStyle)),
              ],
            ),
          ),
      ],
    );
  }
}

/// `1.12.1+356 · 2026-11-04`
String testBuildNotesCaption(TestBuildNotes notes) => [
  if (notes.version.isNotEmpty) notes.fullVersion,
  if (notes.date.isNotEmpty) notes.date,
].join(' · ');

/// "What's new in build N", shown once after a test build is installed.
abstract final class TestBuildNotesPrompt {
  /// Lets launch settle first, like the normal What's new prompt.
  @visibleForTesting
  static Duration settleDelay = const Duration(milliseconds: 1200);

  /// Call on every launch of the test app; shows the sheet only on the
  /// first launch of a build that has notes. Silent on any failure.
  static Future<void> showIfNew(BuildContext context) async {
    try {
      final notes = await TestBuildNotesStore.recordLaunch();
      if (notes == null) return;
      await Future<void>.delayed(settleDelay);
      if (!context.mounted) return;
      await show(context, notes);
    } catch (error) {
      debugPrint('[TestBuildNotes] Launch notes failed: $error');
    }
  }

  static Future<void> show(BuildContext context, TestBuildNotes notes) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        final l = AppLocalizations.of(ctx)!;
        final tt = Theme.of(ctx).textTheme;
        final cs = Theme.of(ctx).colorScheme;
        final caption = testBuildNotesCaption(notes);
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(ctx).size.height * 0.8,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l.testBuildNotesTitle(notes.build),
                    style: tt.titleLarge,
                  ),
                  if (caption.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      caption,
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ],
                  const SizedBox(height: 16),
                  TestBuildNoteList(notes: notes.notes),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FilledButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(l.gotIt),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
