// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  // String res = '';
  static String result = '';

  static User? user = FirebaseAuth.instance.currentUser;

  static CollectionReference col =
      FirebaseFirestore.instance.collection('users');

  static CollectionReference col2 =
      FirebaseFirestore.instance.collection('BarCode');

  Future<void> addDetail() async {
    return col.doc(user?.uid).set(
      {
        'Agqe': '19',
        'CGPA': '8.6',
      },
      SetOptions(merge: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: col2.doc('AryaId').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          

          return Text(
            "Full Name: ${data['barcode']} ",
            style: const TextStyle(fontSize: 16),
          );
        }

        return const Text("loading");
      },
    );
    // Column(
    //   children: [
    //     Center(
    //       child: Container(
    //         height: MediaQuery.of(context).size.height * 0.5,
    //         width: MediaQuery.of(context).size.width * 0.5,
    //         color: Colors.pinkAccent,
    //         child: SizedBox(
    //           height: 50,
    //           width: 50,
    //           child: ElevatedButton(
    //               onPressed: () {
    //                 addDetail();
    //               },
    //               child: const Text("Press TO enter detail")),
    //         ),
    //       ),
    //     ),
    //     ElevatedButton(
    //       onPressed: (){

    //       },
    //       child:
    //     )
    //   ],
    // );
  }
}
