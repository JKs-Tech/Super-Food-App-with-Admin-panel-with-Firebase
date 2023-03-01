import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:super_food/Provider/firebase_auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text("HomePage"),
          onTap: () {
            final provider =
                Provider.of<FirebaseAuthProvider>(context, listen: false);
            provider
                .logOut()
                .then((value) => Fluttertoast.showToast(msg: "Log out"))
                .onError((error, stackTrace) =>
                    Fluttertoast.showToast(msg: error.toString()));
          },
        ),
      ),
    );
  }
}
