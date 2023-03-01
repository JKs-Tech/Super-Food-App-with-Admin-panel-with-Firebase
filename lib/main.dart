import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:super_food/Provider/firebase_auth_provider.dart';
import 'package:super_food/auth/screens/home_screen.dart';
import 'package:super_food/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseAuthProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Super Food',
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              } else if (snapshot.hasData) {
                return HomeScreen();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something Went Wrong"),
                );
              } else {
                return LogiScreen();
              }
            },
          )),
    );
  }
}
