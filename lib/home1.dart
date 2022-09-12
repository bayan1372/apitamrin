import 'dart:io';

import 'package:flutter/material.dart';

import 'models/coin-models.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'models/coin-models.dart';
import 'home2.dart';

import 'package:flutter/material.dart';

// class Home1 extends StatefulWidget {
//   @override
//   _Home1State createState() => _Home1State();
// }

// class _Home1State extends State<Home1> {
//   List<CoinMarket>? apiTestData = [];
//   var apiTestData_var = [];

//   void onSelected(int index) {
//     setState(() {
//       page_index = index;
//     });
//   }

//   List? api_list_final = [];
//   Future<List<CoinMarket>?> get_api_coin() async {
//     const infourl =
//         'http://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true';
//     var response = await http.get(Uri.parse(infourl), headers: {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//     });
//     if (response.statusCode == 200) {
//       var data_get = response.body;
//       apiTestData = coinMarketFromJson(data_get);
//       setState(() {
//         api_list_final = apiTestData;
//         apiTestData_var = api_list_final!;
//         users = apiTestData!;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     get_api_coin();
//   }

//   late List<CoinMarket> users;
//   int? sortColumnIndex;
//   bool isAscending = false;
//   int page_index = 0;
//   int exit_index = 0;

//   @override
//   Widget build(
//     BuildContext context,
//   ) =>
//       SafeArea(
//         child: WillPopScope(
//           onWillPop: () async {
//             Future.delayed(const Duration(milliseconds: 500), () {
//               setState(() {
//                 exit_index = 0;
//               });
//             });
//             exit_index++;
//             if (exit_index == 2) {
//               exit(1);
//             } else {
//               // showExitMessenger();
//             }
//             return false;
//           },
//           child: Scaffold(
//             appBar: AppBar(
//               elevation: 10.0,
//               //  toolbarHeight: myheight * 0.08,
//               backgroundColor: Colors.black38,
//               actions: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.search),
//                 )
//               ],
//               title: const Text("ارز دیجیتال"),
//               centerTitle: true,
//               leading: const Icon(Icons.arrow_back),
//             ),
//             body: SafeArea(child: ScrollableWidget(child: buildDataTable())),
//           ),
//         ),
//       );

//   Widget buildDataTable() {
//     final columns = [
//       "نماد",
//       "نام ارز",
//       ' قیمت',
//       ' قیمت بالای 24 ساعت',
//     ];

//     return DataTable(
//       sortAscending: isAscending,
//       sortColumnIndex: sortColumnIndex,
//       columns: getColumns(columns),
//       rows: getRows(users),
//     );
//   }

//   List<DataColumn> getColumns(List<String> columns) => columns
//       .map((String column) => DataColumn(
//             label: Text(column),
//           ))
//       .toList();

//   List<DataRow> getRows(List<CoinMarket> users) => users.map((CoinMarket user) {
//         final cells = [
//           Image.network(user.image!).toString(),
//           user.name,
//           user.currentPrice.toString(),
//           user.high24H
//         ];

//         return DataRow(cells: getCells(cells));
//       }).toList();

//   List<DataCell> getCells(List<dynamic> cells) =>
//       cells.map((data) => DataCell(Text('$data'))).toList();

//   int compareString(bool ascending, String value1, String value2) =>
//       ascending ? value1.compareTo(value2) : value2.compareTo(value1);
// }

// class ScrollableWidget extends StatelessWidget {
//   final Widget child;

//   const ScrollableWidget({
//     Key? key,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           child: child,
//         ),
//       );
// }

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
            backgroundColor: Colors.black54,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
            title: const Text("ارز دیجیتال"),
            centerTitle: true,
 leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),          ),
          body: Column(
            children: [
              Container(
                height: myheight * 0.07,
                width: mywidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text(""), Text("نام ارز"), Text("قیمت")],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: api_list_final!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home2(
                                      data_pass: api_list_final![index])));
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: myheight * 0.08,
                            width: mywidth,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                        api_list_final![index].image),
                                  ),
                                  Text(api_list_final![index].name),
                                  Text(api_list_final![index]
                                      .currentPrice
                                      .toString()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ))
            ],
          )),
    );
  }
}
