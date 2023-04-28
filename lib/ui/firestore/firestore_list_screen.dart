import 'package:firebase/ui/firestore/add_data_in_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase/ui/auth/login%20screen.dart';
import 'package:firebase/ui/posts/add_post.dart';
import 'package:firebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('usama'),
              );
            },
          )),
        ],
      )),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('FireStore')),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: Icon(Icons.logout),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddDataInFireStore()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialogue(String title, String id) async {
    editController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('update'),
          content: Container(
            child: TextField(
              controller: editController,
              decoration: InputDecoration(hintText: 'EDIT HERE'),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('cancel')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('update')),
          ],
        );
      },
    );
  }
}
