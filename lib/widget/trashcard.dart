import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Constants.dart';

Widget TrashCard(Function()? onTap, QueryDocumentSnapshot doc) {
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
            doc['DTitle'], // Title
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            doc["DDesc"], // Description
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          Spacer(),

        ],
      ),
    ),
  );
}
