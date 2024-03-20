import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khrch_app/lunchpage/context_page.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          systemNavigationBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: RichText(
                  text: const TextSpan(
                      text: "Hello\nThere",
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                    TextSpan(
                      text: ".",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ])),
            ),
            const SizedBox(
              height: 260,
            ),
            Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return const ContextPage();
                          },
                          opaque: false),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45)),
                  backgroundColor: Colors.lightGreen,
                  child: const Icon(Icons.arrow_forward_outlined),
                ),
              ),
            ),
            const letGoButton(),

          ]
          ),
    );
  }
}

// ignore: camel_case_types
class letGoButton extends StatelessWidget {
  const letGoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Text(
          "Let's Go",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
      ),
    );
  }
}
