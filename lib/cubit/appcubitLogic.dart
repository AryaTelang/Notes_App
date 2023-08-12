import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_second/cubit/note/note_cubit.dart';
import 'package:notes_app_second/cubit/note/note_state.dart';
import 'package:notes_app_second/screens/home.dart';

import '../screens/Welcome.dart';
class NoteCubitLogic extends StatefulWidget {
  const NoteCubitLogic({Key? key}) : super(key: key);

  @override
  State<NoteCubitLogic> createState() => _NoteCubitLogicState();
}

class _NoteCubitLogicState extends State<NoteCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NoteCubit,NoteState>(
        builder: (context,state){
          if(state is LoadingState){
            return Center(
              child: CircularProgressIndicator(),

            );
          }
          if(state is WelcomeState)
            {
              return WelcomePage();
            }
          if(state is LoadedState)
            {
              return HomePage();
            }
          else{
            return Center(
              child: Text(state.toString()),
            );
          }

        },
      ),
    );
  }
}
