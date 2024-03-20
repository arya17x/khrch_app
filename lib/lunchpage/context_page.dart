// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:khrch_app/loginFolder/login_page.dart';

class ContextPage extends StatelessWidget {
  const ContextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     // Status bar color
      //     statusBarColor: Colors.white,
      //     systemNavigationBarColor: Colors.white,

      //     // Status bar brightness (optional)
      //     statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //     statusBarBrightness: Brightness.light, // For iOS (dark icons)
      //   ),
      // ),
      //backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: RichText(
                        text: const TextSpan(
                            text: "Welcome To\n",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                            children: [
                          TextSpan(
                            text: "AryaSM",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          )
                        ])),
                  ),

                  Container(
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardContext(imagesyntax: "assets/page.svg"),
                          CardContext(imagesyntax: "assets/page2.svg"),
                          CardContext(imagesyntax: "assets/page3.svg"),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 500,
                  //   child: ListView(
                  //       scrollDirection: Axis.horizontal,
                  //       //      physics: BouncingScrollPhysics(),
                  //       // shrinkWrap: true,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Container(
                  //             height: 400,
                  //             width: 350,
                  //             decoration: BoxDecoration(
                  //                 color: const Color(0xFFF9F6EE),
                  //                 borderRadius: const BorderRadius.all(
                  //                   Radius.circular(40),
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: const Color(0xFF1056C6)
                  //                         .withOpacity(0.15),
                  //                     blurRadius: 50,
                  //                     spreadRadius: 5,
                  //                     offset: const Offset(0, 40),
                  //                   )
                  //                 ]),
                  //             child: Column(
                  //               children: [
                  //                 SvgPicture.asset("assets/page.svg"),
                  //               ],
                  //             ),
                  //             // child:
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Container(
                  //             height: 450,
                  //             width: 350,
                  //             decoration: BoxDecoration(
                  //                 color: const Color(0xFFF9F6EE),
                  //                 borderRadius: const BorderRadius.all(
                  //                   Radius.circular(40),
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: const Color(0xFF1056C6)
                  //                           .withOpacity(0.15),
                  //                       blurRadius: 50,
                  //                       spreadRadius: 5,
                  //                       offset: const Offset(0, 40))
                  //                 ]),
                  //             child: Stack(
                  //               children: [
                  //                 SvgPicture.asset("assets/page2.svg"),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Container(
                  //             height: 450,
                  //             width: 350,
                  //             decoration: BoxDecoration(
                  //                 color: const Color(0xFFF9F6EE),
                  //                 borderRadius: const BorderRadius.all(
                  //                   Radius.circular(40),
                  //                 ),
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: const Color(0xFF1056C6)
                  //                           .withOpacity(0.15),
                  //                       blurRadius: 50,
                  //                       spreadRadius: 10,
                  //                       offset: const Offset(0, 40))
                  //                 ]),
                  //             child: Stack(
                  //               children: [
                  //                 SvgPicture.asset("assets/page3.svg"),
                  //               ],
                  //             ),
                  //           ),
                  //         )
                  //       ]),
                  // ),
                  const SizedBox(height:50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 90,
                            height: 60,
                            child: FloatingActionButton(
                              heroTag: UniqueKey(),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: const Color(0xFFF9F6EE),
                              child: const Text("Skip"),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 90,
                            height: 60,
                            child: FloatingActionButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation, _) {
                                        return const LoginPage();
                                      },
                                      opaque: false),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.lightGreen,
                              child: const Text("Next"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
        );
      }),
    );
  }
}

class CardContext extends StatelessWidget {
  const CardContext({
    required this.imagesyntax,
    super.key,
  });
  final String imagesyntax;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
              color: const Color(0xFFF9F6EE),
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1056C6).withOpacity(0.15),
                  blurRadius: 50,
                  spreadRadius: 5,
                  offset: const Offset(0, 40),
                )
              ]),
          child: Stack(
            children: [
              SvgPicture.asset(imagesyntax),
            ],
          ),
          // child:
        ),
      ),
    );
  }
}
