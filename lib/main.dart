import 'package:contacts_app/home_page.dart';
import 'package:contacts_app/login_or_register_page.dart';
import 'package:contacts_app/login_page.dart';
import 'package:contacts_app/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final contactController = TextEditingController();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
var auth = FirebaseAuth.instance;
// var isLogin = false;

// checkIfLogin() async {
//   auth.authStateChanges().listen((User? user) { 
//     if(user!= null && mounted){
//       setState(() {
//         isLogin = true;
//       });
//     }

//   });
// }

// @override
//   void initState() {
//     checkIfLogin();
//     super.initState();
//   }
  User? user;

  @override
  void initState() {
    super.initState();
    user=FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yellow Class Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
       home: user!=null ? const HomePage() : const AuthPage(),
    );
  }
}
