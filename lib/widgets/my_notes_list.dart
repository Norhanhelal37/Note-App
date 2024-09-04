import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/widgets/custome_note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNotesList extends StatefulWidget {
  const MyNotesList({super.key});

  @override
  State<MyNotesList> createState() => _MyNotesListState();
}

class _MyNotesListState extends State<MyNotesList> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        List<MyNote> notes;
        notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding:const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return CustomeNote(
                  note: notes[index],
                );
              }),
        );
      },
    );
  }
}
