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

  List? api_list_final = [];
  Future<List<CoinMarket>?> get_api_coin() async {
    const infourl =
        'http://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true';
    var response = await http.get(Uri.parse(infourl), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      var data_get = response.body;
      apiTestData = coinMarketFromJson(data_get);
      setState(() {
        api_list_final = apiTestData;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    get_api_coin();
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
