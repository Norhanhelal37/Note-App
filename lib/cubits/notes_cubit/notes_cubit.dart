import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'notes_states.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<MyNote>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<MyNote>("notes_box");
    notes = notesBox.values.toList();
   
    emit(NotesSucess(notes!));
  }
}
