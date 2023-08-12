import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants.dart';
import '../cubit/note/note_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.bgColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("NOTES APP",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900),),
            SizedBox(height: 20,),
            Icon(Icons.note_add_outlined,size: 50,color: Colors.pinkAccent,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                BlocProvider.of<NoteCubit>(context).getData();

              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Constants.noteColor,
                  borderRadius: BorderRadius.circular(2.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(child: Text("View Notes",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
