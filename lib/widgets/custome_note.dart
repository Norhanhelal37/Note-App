import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/screens/edit_note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeNote extends StatelessWidget {
  const CustomeNote({
    super.key,
    required this.note,
  });
  final MyNote note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:const BorderRadius.all(Radius.circular(20)),
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return EditNote(
            note: note,
          );
        }));
      },
      child: Dismissible(
        key: Key(note.title),
        direction: DismissDirection.startToEnd,
        onDismissed: (DismissDirection d) {
          note.delete();
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        },
        background: Container(
          height: 150,
          width: 300,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 113, 103),
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 26,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.only(right: 10),
          height: 150,
          width: 500,
          decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                note.content,
                style: const TextStyle(color: Colors.black, fontSize: 23),
              ),
            ),
            Text(
              note.date,
              style:const TextStyle(color: Colors.black),
            )
          ]),
        ),
      ),
    );
  }
}
