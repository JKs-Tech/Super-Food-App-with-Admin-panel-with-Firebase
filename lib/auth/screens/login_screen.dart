import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:super_food/Provider/firebase_auth_provider.dart';

class LogiScreen extends StatefulWidget {
  const LogiScreen({super.key});

  @override
  State<LogiScreen> createState() => _LogiScreenState();
}

class _LogiScreenState extends State<LogiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(230, 232, 238, 20),
            image: DecorationImage(
                image: AssetImage(
              "assets/home_food.jpeg",
            ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                final provider =
                    Provider.of<FirebaseAuthProvider>(context, listen: false);

                provider.googleLogin().then((value) => Fluttertoast.showToast(
                      msg: "LogedIn",
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 18,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/google.png"),
                    const Text("SignIn With Google")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
