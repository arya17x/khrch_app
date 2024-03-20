import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khrch_app/homeScreen/about_Section.dart';

import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:flutter/material.dart';

import 'package:khrch_app/loginFolder/login_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    AboutSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            child: _widgetOptions[_selectedIndex],
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
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.heart,
                      text: 'Likes',
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
      //last
    ) //
        );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "-1";
  String qrFind = '';

  void signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false));
  }

  Future<DocumentSnapshot> getUserInfo() async {
    return await FirebaseFirestore.instance
        .collection('BarCode')
        .doc('AryaId')
        .get();
  }

  qrCode() async {
    const AboutSection();

    var res = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(),
        ));
    setState(() {
      if (res is String) {
        result = res;
        // Navigator.of(context).pop();
      }
    });
  }

  // Future docID() async {
  //   DocumentSnapshot<Map<String, dynamic>> docId =
  //       await FirebaseFirestore.instance.collection('BarCode').doc('qr').get();
  //   qrFind=docId.reference;
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 45,
          ),
          //AppBar Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                child: RichText(
                  text: const TextSpan(
                      text: "Hey",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: "\nArya.",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ))
                      ]),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 25, 0),
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  backgroundColor: const Color(0xFFF9F6F2),
                  splashColor: Colors.black.withOpacity(0.2),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            //shadowColor: Colors.grey,
                            surfaceTintColor: Colors.transparent,
                            actionsAlignment: MainAxisAlignment.center,
                            titleTextStyle: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                            //elevation: 20,
                            icon: const Icon(Icons.settings_power_rounded),
                            content:
                                const Text("        Do You want to logout"),

                            title: const Text("Logout"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    signOut();
                                  },
                                  child: const Text("Yes")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  //
                                  child: const Text("No")),
                            ],
                            //backgroundColor: Colors.transparent,
                            backgroundColor: const Color(0xFFF9F6F2),
                          );
                        });
                  },
                  child: const Icon(Icons.settings_power_rounded),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          SizedBox(
            height: 250,
            width: 450,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.grey,
                elevation: 15,
                color: const Color(0xFFf9f6f2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          PermissionStatus cameraPermissionStatus =
                              await Permission.camera.status;

                          if (!cameraPermissionStatus.isGranted) {
                            cameraPermissionStatus =
                                await Permission.camera.request();
                          }
                          if (cameraPermissionStatus ==
                              PermissionStatus.granted) {
                            qrCode();
                          } else if (cameraPermissionStatus ==
                              PermissionStatus.denied) {
                          } else if (cameraPermissionStatus ==
                              PermissionStatus.permanentlyDenied) {
                            openAppSettings();
                          }
                        },
                        child: const Icon(
                            size: 85,
                            color: Color(0xFF4a006a),
                            Icons.qr_code_scanner_rounded),
                      ),
                    ),
                    Text("QR code result $result"),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width * .5,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.grey,
                    elevation: 15,
                    color: Color(0xFFE0F0E3),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width * .5,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.grey,
                    elevation: 15,
                    color: Color(0xFFE0F0E3),
                    child: AboutSection()
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
