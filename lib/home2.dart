import 'dart:io';
import 'package:flutter/material.dart';
import 'models/coin-models.dart';
import 'models/coin-models.dart';

class Home2 extends StatefulWidget {
  var data_pass;

  Home2({Key? key, this.data_pass}) : super(key: key);

  @override
  State<Home2> createState() => _DescriptionState();
}

class _DescriptionState extends State<Home2> {
  void showExitMessenger(String name) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 5),
        content: Text("لطفا دو بار دکمه برگشت را بزنید")));
  }

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: myheight * 0.08,
        backgroundColor: Colors.black54,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text(""),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(children: [
        CircleAvatar(child: Image.network(widget.data_pass.image), radius: 50),
        Container(
          child: Text(widget.data_pass.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        Row(children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "جزئیات",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: const Divider(color: Colors.black, height: 50)),
          ),
        ]),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              // my_list("نام ارز", widget.data_pass.name),
              my_list(" نماد", widget.data_pass.symbol),
              my_list("قیمت ارز", widget.data_pass.currentPrice.toString()),
              my_list(
                  "نوسان کمتر از 24 ساعت", widget.data_pass.low24H.toString()),
              my_list(
                  "نوسان بالای 24 ساعت", widget.data_pass.high24H.toString()),
              my_list("تغییر قیمت در 24 ساعت",
                  widget.data_pass.priceChange24H.toString()),
              my_list(" درصد تغییر ارزش بازار در 24 ساعت",
                  widget.data_pass.marketCapChangePercentage24H.toString()),
              my_list("تامین کل", widget.data_pass.totalSupply.toString()),
              my_list("درصد تغییر atl",
                  widget.data_pass.atlChangePercentage.toString()),
              //     my_list(" تغییرات قیمت در 24 ساعت", widget.data_pass.price_change_24h.toString()),
              //      my_list(" تغییرات قیمت در 24 ساعت", widget.data_pass.price_change_24h.toString()),
              //     my_list(" تغییرات قیمت در 24 ساعت", widget.data_pass.price_change_24h.toString()),
            ]),
          ),
        )
      ]),
    ));
  }

  Widget my_list(
    String title,
    String data,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: myheight * 0.07,
        width: mywidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text(title), Text(data)],
        ),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
