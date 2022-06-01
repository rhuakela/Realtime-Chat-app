import 'package:flutter/material.dart';
import 'package:skapp/helper/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff1DE9B6),
        scaffoldBackgroundColor: Colors.white24,
        primarySwatch: Colors.teal,
      ),
      home: const Authenticate(),
    );
  }
}

