import 'package:flutter/material.dart';

import 'package:flutter_application_1/cubits/add_cubit/add_notes_cubit.dart';
import 'package:flutter_application_1/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/widgets/colors_list.dart';
import 'package:flutter_application_1/widgets/custome_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


// ignore: must_be_immutable
class AddNote extends StatelessWidget {
  AddNote({super.key});
  final GlobalKey<FormState> _key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNotesCubit>(
      create: (context) => AddNotesCubit(),
      child: Form(
        key: _key,
        autovalidateMode: autovalidateMode,
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNotesFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Something went wrong')));
            } else {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }
          },
          builder: (BuildContext context, AddNotesState state) {
            return SimpleDialog(
              backgroundColor:const Color.fromARGB(255, 162, 245, 199),
              contentPadding: const EdgeInsets.all(40),
              title: const Text(
                "Add note",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              children: [
                MyField(
                  lable: "Title",
                  maxlines: 1,
                  onSaved: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyField(
                  lable: "Your Note",
                  maxlines: 7,
                  onSaved: (value) {
                    subtitle = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
               const ColorsList(),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            BlocProvider.of<AddNotesCubit>(context).addnote(
                                MyNote(
                                    title: title!,
                                    content: subtitle!,
                                    date: DateFormat.yMd()
                                        .format(DateTime.timestamp())
                                        .toString(),
                                    color:const Color.fromARGB(255, 136, 197, 247).value ));
                           
                            Navigator.pop(context);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        child: (state is AddNotesLoading)
                            ? const CircularProgressIndicator()
                            : const Text("Save")),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancle")),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

