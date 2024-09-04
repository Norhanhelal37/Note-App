import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/widgets/custome_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});
  final MyNote note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(widget.note.color),
        title: const Text(
          "Edit Note",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: 400,
            child: MyField(
                onchange: (value) {
                  title = value;
                },
                lable: "Title",
                
                maxlines: 1,
                hint: widget.note.title
                ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: 400,
            child: MyField(
                onchange: (value) {
                  content = value;
                },
                lable: "Your Note",
                maxlines: 10,
                hint: widget.note.content
                ),
          ),
        ],
      ),
    );
  }
}
