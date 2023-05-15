import 'package:test_example/constants.dart';

class NoteApiProvider {
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    await Future.delayed(const Duration(seconds: 2));
    return Constants.items;
  }
}
