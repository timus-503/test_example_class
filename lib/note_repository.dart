// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_example/note.dart';
import 'package:test_example/note_api_provider.dart';

class NoteRepository {
  final NoteApiProvider noteApiProvider;
  NoteRepository({
    required this.noteApiProvider,
  });

  bool _isLoading = false;

  List<Note> _notes = [];

  bool get isLoading => _isLoading;

  List<Note> get notes => _notes;

  Future<List<Note>> fetchAllNotes() async {
    _isLoading = true;
    final res = await noteApiProvider.fetchNotes();
    final items = res.map((e) => Note(id: e["id"], title: e["title"])).toList();
    _notes.clear();
    _notes.addAll(items);
    _isLoading = false;
    return _notes;
  }
}
