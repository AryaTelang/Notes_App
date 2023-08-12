import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_second/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({Key? key}) : super(key: key);

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor,
      appBar: AppBar(
        title: Text("Add a new note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  label: Text("Title"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),

                  hintText: "Note Title"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                  label: Text("Description"),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  hintText: "Add your description"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          FirebaseFirestore.instance.collection("notes").add({
            "Title": titleController.text,
            'Description': descController.text,
          }).then((value){
            print(value.id);
            Navigator.pop(context);
          }).catchError(
            (error)=> print(error));

        },
        child: Icon(Icons.save_outlined,color: Colors.pink,),
      ),
    );
  }
}
