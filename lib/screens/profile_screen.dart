import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/main_screen.dart';
import '../constant/color.dart';
import 'Edit_Profile_Screen.dart';
import 'US_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (!snapshot.hasData)
                                  return CircularProgressIndicator();
                                DocumentSnapshot document = snapshot.data!;
                                
                                return Stack(children: [
      Image(
        width: double.infinity,
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.fill,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
            alignment: Alignment.center,
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
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(document['profilepic']),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GradientText(
                        document['name'],
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: [
                          firstMainColor,
                          secondMainColor,
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          firstMainColor,
                          secondMainColor,
                        ],
                      ),
                    ),
                    width: 350,
                    height: 70,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => EditProfileScreen(),
                            ),
                          );
                        },
                        child: Row(children: [
                          Image(
                            image: AssetImage(
                                "assets/images/mdi_user-outline.png"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Edit profile",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ))
                        ]))),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          firstMainColor,
                          secondMainColor,
                        ],
                      ),
                    ),
                    width: 350,
                    height: 70,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => UsScreen(),
                            ),
                          );
                        },
                        child: Row(children: [
                          Image(
                            image: AssetImage(
                                "assets/images/material-symbols_help-clinic-outline-rounded.png"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Us",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ))
                        ]))),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [
                          firstMainColor,
                          secondMainColor,
                        ],
                      ),
                    ),
                    width: 350,
                    height: 70,
                    child: TextButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('isUserLoggedIn');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image(
                            image: AssetImage("assets/images/Vector.png"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text("Log Out",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ))
                        ]))),
              ])))
    ]);
  })
  );
  }
}
