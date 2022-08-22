import 'package:flutter/material.dart';
import 'models/coin-models.dart';
import 'models/coin-models.dart';
import 'mycolor.dart';

class Home2 extends StatefulWidget {
  var data_pass;

  Home2({Key? key, this.data_pass}) : super(key: key);

  @override
  State<Home2> createState() => _DescriptionState();
}

class _DescriptionState extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: myheight * 0.08,
        backgroundColor: appbarcolor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text(""),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(children: [
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
          child
              : ListView(
                  children:const [
                    // my_list("نام ارز", widget.data_pass.name),
                    // my_list(" نماد", widget.data_pass.symbol),
                    // my_list("قیمت ارز", widget.data_pass.currentPrice.toString()),
                    // my_list("نوسان کمتر از 24 ساعت", widget.data_pass.low_24h.toString()),
                    // my_list("نوسان بالای 24 ساعت", widget.data_pass.high_24h.toString()),
                    // my_list("رتبه ارزش بازار", widget.data_pass.name.toString()),
                    // my_list("درصد تغییر ارزش بازار", widget.data_pass.market_cap_change_percentage_24h.toString()),
                    // my_list(" تغییرات قیمت در 24 ساعت", widget.data_pass.price_change_24h.toString()),
                  ],
                ),
        )
      ]),
    ));
  }

  Widget my_list(String title, String data) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: myheight * 0.07,
        width: mywidth,
        child: Row(
          children: [Text(title), Text(data)],
        ),
        decoration: BoxDecoration(
            color: listcolor, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
