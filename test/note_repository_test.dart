import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_example/constants.dart';
import 'package:test_example/note.dart';
import 'package:test_example/note_api_provider.dart';
import 'package:test_example/note_repository.dart';

import 'note_repository_test.mocks.dart';

@GenerateMocks([NoteApiProvider])
void main() {
  group("Testing Note Repository", () {
    late NoteRepository noteRepository;
    late NoteApiProvider apiProvider;

    setUpAll(() {
      apiProvider = MockNoteApiProvider();
      noteRepository = NoteRepository(noteApiProvider: apiProvider);
    });

    test("Testing Initial Condition", () {
      expect(noteRepository.isLoading, false);
      expect(noteRepository.notes, isEmpty);
      expect(noteRepository.notes, isA<List<Note>>());
    });

    test("Testing Api Success Condition", () async {
      when(apiProvider.fetchNotes()).thenAnswer((_) async {
        return Constants.items;
      });
      List<Note> _testData = Constants.items
          .map((e) => Note(id: e["id"], title: e["title"]))
          .toList();
      final res = await noteRepository.fetchAllNotes();
      expect(res, isNotEmpty);
      expect(res, isA<List<Note>>());
      expect(res, contains(_testData.first));
      expect(noteRepository.isLoading, false);
      verify(apiProvider.fetchNotes()).called(1);
    });

    test(
      "Test Exception",
      () async {
        when(apiProvider.fetchNotes())
            .thenThrow(SocketException("No Internet Connection Available"));
        try {
          await noteRepository.fetchAllNotes();
        } catch (e) {
          expect(e, isA<SocketException>());
        }
      },
    );
  });
}
