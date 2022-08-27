import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'home1.dart';
import 'testttt.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const Spacer(),
            const Center(
              child: Text(
                "Digital currency",
                style:
                    TextStyle(color: Colors.white54, fontSize: 30),
              ),
            ),
           const Text(
              "ارز دیجیتال",
              style: TextStyle(color: Colors.white54, fontSize: 30),
            ),
            Lottie.asset('assets/coins.json')
          ]),
        ),
      ),
    );
  }
}
