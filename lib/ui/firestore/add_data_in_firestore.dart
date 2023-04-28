import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/utils/utils.dart';
import 'package:firebase/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddDataInFireStore extends StatefulWidget {
  const AddDataInFireStore({Key? key}) : super(key: key);

  @override
  State<AddDataInFireStore> createState() => _AddDataInFireStoreState();
}

class _AddDataInFireStoreState extends State<AddDataInFireStore> {
  final postController = TextEditingController();
  bool loading = false;
  final FireStore = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('add FireStore Data')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'Whats in your mind', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'ADD',
              loading: loading,
              onTap: () {
                setState(() {
                  loading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                FireStore.doc(id).set({
                  'title': postController.text.toString(),
                  'id': id
                }).then((value) {
                  Utils().toastMessage('post added');
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
