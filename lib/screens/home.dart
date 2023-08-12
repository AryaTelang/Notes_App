import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_second/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app_second/screens/NewNoteScreen.dart';
import 'package:notes_app_second/screens/ReadNote.dart';
import 'package:notes_app_second/widget/noteCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'TrashPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String Noteid = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.bgColor,
        appBar: AppBar(
          title: Text("Notes App"),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing:
                              16.0,
                          mainAxisSpacing: 16.0,
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadNote(note)));
                              }, note))
                          .toList(),
                    );
                  }
                  return Text("Nothing to see here");
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
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
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrashPage()));
                      },
                      child:  Text(
                        "Trash Notes",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewNoteScreen()));
          },
          icon: Icon(Icons.add),
          label: Text("Add"),
        ));
  }
}
