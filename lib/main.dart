import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_application_1/models/note_model.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(MyNoteAdapter());
  await Hive.openBox<MyNote>("notes_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider(create: (context)=> NotesCubit())
      ],
      child:  MaterialApp(
        theme: ThemeData(
          fontFamily: "Pacifico",
          
        ),
        
          debugShowCheckedModeBanner: false,
         

          home:const Scaffold(
            body: Home(),
          )),
    );
  }
}
