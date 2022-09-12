// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Test extends StatefulWidget {
//   Test({Key? key}) : super(key: key);


//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//     void onSelected(int index) {
//     setState(() {
//       page_index = index;
//     });
//   }
//   int page_index = 0;
//   int exit_index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope( 
//       child: Scaffold(backgroundColor: Colors.white ,),
      
//       onWillPop: () async {
//         Future.delayed(const Duration(milliseconds: 500), () {
//           setState(() {
//             exit_index = 0;
//           });
//         });
//         exit_index++;
//         if (exit_index == 2) {
//           exit(1);
//         } else {
//           // showExitMessenger();
//         }
//         return false;
        
//       },);
//   }
// }