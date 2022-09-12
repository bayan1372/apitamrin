import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'home1.dart';
import 'models/coin-models.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
with SingleTickerProviderStateMixin {
   List<CoinMarket>? apiTestData = [];
  var apiTestData_var = [];
  AnimationController? controller ;

 
  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: const Duration(seconds: 5));
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home1()));
    });
    controller!.forward();
  }
  void dispose (){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Center(
              child: Text(
                "Digital currency",
                style: TextStyle(color: Colors.white54, fontSize: 30),
              ),
            ),
            const Text(
              "ارز دیجیتال",
              style: TextStyle(color: Colors.white54, fontSize: 30),
            ),
            Lottie.asset('assets/10.json', height: 400)
          ]),
        ),
      ),
    );
  }
}
