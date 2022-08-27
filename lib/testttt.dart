import 'package:apitamrin/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'models/coin-models.dart';
import 'home2.dart';

class Home1 extends StatefulWidget {
  Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  List<CoinMarket>? apiTestData = [];
  var apiTestData_var = [];

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
  }

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        toolbarHeight: myheight * 0.08,
        backgroundColor: appbarcolor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text("ارز دیجیتال"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
      // backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            border: TableBorder.all(style: BorderStyle.none, width: 2),
            columnSpacing: 20.0,
            columns: const [
              DataColumn(label: Text('')),
              DataColumn(
                label: Text('نماد',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              DataColumn(
                  label: Text('قیمت',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('نوسان بالای 24 ساعت',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Container(
                      width: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: api_list_final!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ( context,  index) {
                          return Container(
                            width: 10,
                            child: Image.network(api_list_final![index].image));
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: api_list_final!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(api_list_final![index].symbol);
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: api_list_final!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Text( api_list_final![index].currentPrice.toString());
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: api_list_final!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(api_list_final![index].high24H.toString());
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // body: ListView.builder(
      //         itemCount:
      //         itemBuilder: (context, index) {
      //
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: listcolor,
      //                   borderRadius: BorderRadius.circular(15)

      //                 ),
      //                 child: SingleChildScrollView(
      //                 //   child: DataTable(
      //                 //       border: TableBorder.all(
      //                 //           style: BorderStyle.none,
      //                 //           width: 2),
      //                 //       columnSpacing: 20.0,
      //                 //
      //                 //       rows: [
      //                 //         DataRow(cells: [
      //                 //           DataCell(Container(
      //                 //               width: 30,
      //                 //               child: Image.network(y))),
      //                 //           DataCell(Container(child: Text(x))),
      //                 //           DataCell(Container(child: Text(w))),
      //                 //           DataCell(Container(child: Text(z)))
      //                 //         ])
      //                 //       ]),
      //                 // ),
      //               ),
      //             ),
      //           );
      //         })
    ));
  }

  Widget mytext(String title) {
    return Container(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white54,
        ),
      ),
    );
  }
}
