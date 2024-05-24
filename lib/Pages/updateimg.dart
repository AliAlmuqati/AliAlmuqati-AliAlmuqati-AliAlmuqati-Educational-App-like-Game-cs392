import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class edite_img extends StatefulWidget {
  const edite_img({Key? key});

  @override
  State<edite_img> createState() => _edite_imgState();
}

class _edite_imgState extends State<edite_img> {
  TextEditingController controller = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;
  var profileimgpath = '';
  var profileImageLink = '';

  changeimage(context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (img == null) return;
      setState(() {
        profileimgpath = img.path;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.35,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 15)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Add the new Image',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close, color: Colors.black38),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    profileimgpath.isEmpty
                        ? CircleAvatar(
                            radius: 50,
                            child: Image.asset('images/toppng 1.png'),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(File(profileimgpath)),
                          ),
                    MaterialButton(
                      color: Colors.white,
                      onPressed: () async {
                        changeimage(context);
                      },
                      child: const Icon(Icons.add, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () async {
                    var filename = basename(profileimgpath);
                    var destination = 'images/${currentUser.email}/$filename';
                    Reference ref =
                        FirebaseStorage.instance.ref().child(destination);
                    await ref.putFile(File(profileimgpath));
                    profileImageLink = await ref.getDownloadURL();
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(currentUser.email)
                        .update({
                      'img': profileImageLink,
                      // You can add more fields to update here
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.white)),
                ),
                SizedBox(width: size.width * 0.01),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                  color: Colors.white54,
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.black45)),
                ),
                SizedBox(width: size.width * 0.01),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
