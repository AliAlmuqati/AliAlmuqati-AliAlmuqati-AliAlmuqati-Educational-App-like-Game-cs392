import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs290_app/Pages/editeEmail.dart';
import 'package:cs290_app/Pages/updateimg.dart';
import 'package:cs290_app/editepassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

final _db = FirebaseFirestore.instance;

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  var profileimgpath = '';
  var profileImageLink = '';

  changeimage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      setState(() {
        profileimgpath = img.path;
      });
    } on PlatformException catch (e) {
      print(e.toString());
      // Handle the error here, e.g., by showing a toast or dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff6ccbe),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _db.collection("Users").doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userdata = snapshot.data?.data() as Map<String, dynamic>?;
            final imgUrl = userdata?['img'];

            return Container(
              color: Color(0xfff6ccbe),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE1A99A),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2, color: Color(0xffDAFBFC)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            imgUrl != null && imgUrl.isNotEmpty
                                                ? ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child: CircleAvatar(
                                                radius: 50,
                                                backgroundImage: NetworkImage(imgUrl),
                                              ),
                                            )
                                                : CircleAvatar(
                                              radius: 50,
                                              backgroundImage: AssetImage("images/toppng 1.png"),
                                            ),
                                            MaterialButton(
                                              color: Colors.white,
                                              onPressed: () async {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return edite_img();
                                                  },
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  Text(' Add Profile'),
                                                  Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "${userdata?["firstname"] ?? ''} ${userdata?['lastname'] ?? ''} ",
                                          style: GoogleFonts.roboto(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                offset: Offset(5.0, 5.0),
                                                blurRadius: 1.0,
                                                color: Colors.black26,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return edite_password();
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25, right: 25),
                                  child: Container(
                                    height: 64,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Change Password',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 35),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return edite_Email();
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25, right: 25),
                                  child: Container(
                                    height: 64,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Change Email',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 100),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Delete Account",
                                    style: GoogleFonts.roboto(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
