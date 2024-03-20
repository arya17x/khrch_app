import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:khrch_app/lunchpage/main_screen.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formkey = GlobalKey<FormState>();

  bool ishidden = true;
  visible() {
    ishidden = !ishidden;
    setState(() {});
  }

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 1), () async {
      try {
        
        UserCredential authresult = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: controller1.text.toString(),
                password: controller2.text.toString());
        
        User? user = authresult.user;
        
        if (user != null) {
          controller.success();
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );

          controller.reset();
        }
      } on FirebaseAuthException catch (e) {
        controller.reset();
        if (e.code.toString() == 'user-not-found') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("No user Found with this email")));
        } else if (e.code == 'wrong-password') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password Didnot match")));
        }
      }

      // AuthServices.signinUser(
      //       controller1.text.toString(), controller2.text.toString(), context);
    });
  }

  @override
  void initState() {
    super.initState();
    _btnController1.stateStream.listen((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 800),
        builder: (context, value, child) {
          return ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                  radius: value * 5,
                  colors: const [
                    Colors.white,
                    Colors.white,
                    Colors.transparent,
                    Colors.transparent
                  ],
                  stops: const [0.0, 0.55, 0.60, 1.0],
                  center: const FractionalOffset(0.6, 0.6),
                ).createShader(rect);
              },
              child: child);
        },
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: RichText(
                  text: const TextSpan(
                      text: "Hey",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: "\nwhat's up.",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ))
                      ]),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: const BorderSide(color: Colors.green)),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: controller2,
                  obscureText: ishidden,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        visible();
                      },
                      child: Icon(
                          ishidden ? Icons.visibility : Icons.visibility_off),
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: const BorderSide(color: Colors.green)),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundedLoadingButton(
                elevation: 8,
                color: Colors.lightGreen,
                successColor: Colors.lightGreen,
                controller: _btnController1,
                onPressed: () => _doSomething(_btnController1),
                valueColor: Colors.black,
                borderRadius: 35,
                child: const Text(
                  "Let's Go",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      "Forget Password ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
