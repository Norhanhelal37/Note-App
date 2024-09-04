import "package:flutter/material.dart";
import "package:flutter_application_1/widgets/my_notes_list.dart";
import "package:flutter_application_1/widgets/new_note.dart";


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        title: const Text(
          "My Notes",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 26,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.cyan,
        radius: 30,
        child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddNote();
                },
              );
            },
            icon: const Icon(
              Icons.add,
              size: 27,
              color: Color.fromARGB(255, 8, 64, 110),
            )),
      ),
      body:const MyNotesList()
    );
  }
}
