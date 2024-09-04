import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

part "add_notes_state.dart";

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color color=Color.fromARGB(255, 136, 197, 247);

  addnote(MyNote note) async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<MyNote>("notes_box");

      await notesBox.add(note);
      
      emit(AddNotesSucess());
    } catch (e) {
      AddNotesFailure("e.toString()");
      emit(AddNotesFailure(e.toString()));
    }
  }
}
