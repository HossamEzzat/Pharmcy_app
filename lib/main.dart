import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import
import 'package:untitled/screens/Active_Constituents_screen.dart';
import 'package:untitled/screens/bottom_nav_bar.dart';
import 'package:untitled/screens/dictionary_screen.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/screens/main_screen.dart';
import 'package:untitled/screens/pic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
  
  runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  MyApp({required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: isUserLoggedIn ? const BottomNavBar() : const HomeScreen(),
    );
  }
}
