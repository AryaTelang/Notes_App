import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app_second/screens/home.dart';
import '../Constants.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  String noteId=doc.id;
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Constants.noteColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['Title'], // Title
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            doc["Description"], // Description
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () async {

                String delTitle=doc['Title'];

                String delDesc=doc['Description'];
                deleteNote(noteId,delTitle,delDesc);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                ),
              ))
        ],
      ),
    ),
  );
}
void deleteNote(id,delTitle,delDesc)
{
  FirebaseFirestore.instance.collection("notes").doc(id).delete();
  FirebaseFirestore.instance.collection("trash").add({
    "DTitle": delTitle,
    'DDesc': delDesc,
  });
}
