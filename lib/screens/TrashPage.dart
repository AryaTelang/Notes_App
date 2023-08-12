import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Constants.dart';
import '../widget/noteCard.dart';
import '../widget/trashcard.dart';
import 'ReadNote.dart';
import 'ReadTrashNote.dart';

class TrashPage extends StatefulWidget {
  const TrashPage({Key? key}) : super(key: key);

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor,
      appBar: AppBar(
        title: Text("Trash Notes"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("trash").snapshots(),
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
                        crossAxisSpacing: 16.0, // Adjust the horizontal spacing
                        mainAxisSpacing: 16.0,
                        crossAxisCount: 2),
                    children: snapshot.data!.docs
                        .map((note) => TrashCard(() {}, note))
                        .toList(),
                  );
                }
                return Text("Nothing to see here");
              },
            ),
          ),
        ],
      ),
    );
  }
}
