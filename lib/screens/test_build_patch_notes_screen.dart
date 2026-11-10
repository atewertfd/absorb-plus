import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/test_build_notes.dart';
import '../widgets/test_build_notes_sheet.dart';

/// Developer > Patch notes (Absorb Plus Test app): every test build's notes
/// this phone has seen, newest first. Works offline.
class TestBuildPatchNotesScreen extends StatefulWidget {
  const TestBuildPatchNotesScreen({super.key});

  @override
  State<TestBuildPatchNotesScreen> createState() =>
      _TestBuildPatchNotesScreenState();
}

class _TestBuildPatchNotesScreenState extends State<TestBuildPatchNotesScreen> {
  List<TestBuildNotes>? _history;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final history = await TestBuildNotesStore.history();
    if (mounted) setState(() => _history = history);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final history = _history;
    return Scaffold(
      appBar: AppBar(title: Text(l.patchNotesTitle)),
      body: history == null
          ? const SizedBox.shrink()
          : history.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                l.patchNotesEmpty,
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              itemCount: history.length,
              separatorBuilder: (_, _) => const Divider(height: 32),
              itemBuilder: (context, i) {
                final notes = history[i];
                final caption = testBuildNotesCaption(notes);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.patchNotesBuild(notes.build),
                      style: tt.titleSmall?.copyWith(color: cs.primary),
                    ),
                    if (caption.isNotEmpty)
                      Text(
                        caption,
                        style: tt.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    const SizedBox(height: 8),
                    TestBuildNoteList(notes: notes.notes),
                  ],
                );
              },
            ),
    );
  }
}
