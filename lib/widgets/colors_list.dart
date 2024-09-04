import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubits/add_cubit/add_notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({
    super.key,
  });

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<AddNotesCubit>(context).color =
               const Color.fromARGB(255, 136, 197, 247);
            setState(() {
              index = 0;
            });
          },
          child: MyColor(
            color:const Color.fromARGB(255, 136, 197, 247),
            isactive: (index == 0),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 1;
            });
            BlocProvider.of<AddNotesCubit>(context).color=const Color.fromARGB(255, 130, 240, 148);
          },
          child: MyColor(
            color:const Color.fromARGB(255, 130, 240, 148),
            isactive: (index == 1),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 2;
            });
            BlocProvider.of<AddNotesCubit>(context).color=const Color.fromARGB(255, 26, 145, 224);
          },
          child: MyColor(
            color:const Color.fromARGB(255, 26, 145, 224),
            isactive: (index == 2),
          ),
        ),
      ],
    );
  }
}

class MyColor extends StatelessWidget {
  const MyColor({
    super.key,
    required this.color,
    required this.isactive,
  });
  final Color color;
  final bool isactive;

  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: color,
          );
  }
}
