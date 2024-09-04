part of "notes_cubit.dart";

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesSucess extends NotesState {
  final List<MyNote> notes;
  NotesSucess(this.notes);
} 

class NotesFailure extends NotesState {
  final String errMessage;

  NotesFailure(this.errMessage);
}
