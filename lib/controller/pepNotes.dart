import 'package:smattlife/api/pepNotes.dart';
import 'package:smattlife/models/pepNote.dart';

class PepDb {
  static PepNotesApi notesAPI = PepNotesApi();
  static Future<List<PepNote>> getAllNotes() async {
    List<PepNote> _notes = [];
    try {
      var listOfMaps = await notesAPI.getAll();
      for (var i in listOfMaps) {
        _notes.add(PepNote.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _notes;
  }

  static Future<List<PepNote>> getAllPepMcq() async {
    List<PepNote> _notes = [];
    try {
      var listOfMaps = await notesAPI.getPepMcqAll();
      for (var i in listOfMaps) {
        _notes.add(PepNote.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _notes;
  }

  static Future<List<PepNote>> getAllPepMcqDemo() async {
    List<PepNote> _notes = [];
    try {
      var listOfMaps = await notesAPI.getPepMcqDemoAll();
      for (var i in listOfMaps) {
        _notes.add(PepNote.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _notes;
  }
}
