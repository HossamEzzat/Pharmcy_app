import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/profile_screen.dart';
import '../constant/color.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _isLoading = false;

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');

  String uid = " ";
  bool isUserLoggedIn = false;
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_uid = prefs.getString('uid') ?? '';
    final bool _isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
    setState(() {
      uid = user_uid;
      isUserLoggedIn = _isUserLoggedIn;
    });
  }

  List<XFile> _imageFiles = [];

  Future<void> _pickImages() async {
    final imagePicker = ImagePicker();
    final pickedImages = await imagePicker.pickMultiImage();
    if (pickedImages != null) {
      setState(() {
        _imageFiles = pickedImages;
      });
    }
  }

  Future<String> _uploadImage(File file) async {
    // تحديد مسار التخزين على Firebase Storage
    final filePath = 'images/${DateTime.now()}.png';
    final storageReference = FirebaseStorage.instance.ref().child(filePath);

    // تحميل الصورة إلى Firebase Storage
    final uploadTask = storageReference.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {});
    if (snapshot.state == TaskState.success) {
      // إرجاع رابط الصورة المخزنة
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } else {
      // إرجاع قيمة فارغة في حالة فشل تحميل الصورة
      return '';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              DocumentSnapshot document = snapshot.data!;
              TextEditingController _name =
                  TextEditingController(text: document['name']);

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Image(
                      width: double.infinity,
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => ProfileScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60, left: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: 50,
                          height: 50,
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Column(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                GradientText("Edit Profile",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    colors: [
                                      firstMainColor,
                                      secondMainColor,
                                    ])
                              ]),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                width: 200,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: _imageFiles.isNotEmpty
                                      ? Image.file(File(_imageFiles.first.path))
                                          .image
                                      : NetworkImage(
                                          "${document['profilepic']}"),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                controller: _name,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Change Name",
                                    style: TextStyle(
                                        color: secondMainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: secondMainColor,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF764BA2),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  String? imageUrl;
                                  if (_imageFiles != null &&
                                      _imageFiles.isNotEmpty) {
                                    // تحميل الصورة إلى Firebase Storage
                                    imageUrl = await _uploadImage(
                                        File(_imageFiles.first.path));
                                  }
                                  // تحديث معلومات المستخدم
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(uid)
                                      .update({
                                    "name": _name.text,
                                    "profilepic":
                                        imageUrl ?? "${document['profilepic']}",
                                  });

                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child: _isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        "Saving",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 380,
                      left: 190,
                      child: IconButton(
                        onPressed: _pickImages,
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
