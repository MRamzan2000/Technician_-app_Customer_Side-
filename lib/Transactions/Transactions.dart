import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/ApiServiecestoGetuserTransactions.dart';
import '../Models/TransactionsModel.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  late Future<TransactionsList> _transactionListFuture;


  @override
  void initState() {
    super.initState();
    _transactionListFuture = ApiService.getTransactions();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(

        children: [
          SizedBox(height: 60),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff8cdaa),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: 30,
              width: MediaQuery.of(context).size.width /1.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/Back arrow.svg",
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    Text(
                      "Transactions",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: FutureBuilder<TransactionsList>(
              future: _transactionListFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if( snapshot.data!.transactions.length == 0)
                    {
                      return Center(child: Text("No Transtactions"),);
                    }
                  else {
                    return Expanded(
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = snapshot.data!.transactions[index];
                        return
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1.0, 2.0),
                              )
                            ]),
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: AssetImage("assets/pic.png.webp"),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(100),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 3,
                                                  offset: Offset(1.0, 2.0))
                                            ]),
                                        height: 50,
                                        width: 50,
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            transaction.sellername,
                                            style: TextStyle(fontSize: 14, color: Colors.black),
                                          ),
                                          Text(
                                            transaction.date.substring(0, 10),
                                            style: TextStyle(fontSize: 12, color: Color(0xffBAC0C0)),
                                          )
                                          ,
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${transaction.amount} SR',
                                    style: TextStyle(fontSize: 16, color: Color(0xff653780)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        //   ListTile(
                        //   title: Text(transaction.sellername),
                        //   subtitle: Text(transaction.date),
                        //   trailing: Text('\$${transaction.amount}'),
                        // );
                      },
                    ),
                  );
                  }
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                } else if(!snapshot.hasData) {
                  return Center(child: Text("No Transtactions"));
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }

              },
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey,
          //       blurRadius: 3,
          //       offset: Offset(1.0, 2.0),
          //     )
          //   ]),
          //   height: 90,
          //   width: MediaQuery.of(context).size.width,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   image: DecorationImage(
          //                       image: AssetImage("assets/pic.png.webp"),
          //                       fit: BoxFit.cover),
          //                   borderRadius: BorderRadius.circular(100),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         color: Colors.grey,
          //                         blurRadius: 3,
          //                         offset: Offset(1.0, 2.0))
          //                   ]),
          //               height: 50,
          //               width: 50,
          //             ),
          //             SizedBox(width: 20),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Inzmam Malik",
          //                   style: TextStyle(fontSize: 14, color: Colors.black),
          //                 ),
          //                 Text(
          //                   "September 20,2023",
          //                   style: TextStyle(
          //                       fontSize: 12, color: Color(0xffBAC0C0)),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //         Text(
          //           "256SR",
          //           style: TextStyle(fontSize: 16, color: Color(0xff653780)),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20),
          // Container(
          //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey,
          //       blurRadius: 3,
          //       offset: Offset(1.0, 2.0),
          //     )
          //   ]),
          //   height: 90,
          //   width: MediaQuery.of(context).size.width,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   image: DecorationImage(
          //                       image: AssetImage("assets/pic.png.webp"),
          //                       fit: BoxFit.cover),
          //                   borderRadius: BorderRadius.circular(100),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         color: Colors.grey,
          //                         blurRadius: 3,
          //                         offset: Offset(1.0, 2.0))
          //                   ]),
          //               height: 50,
          //               width: 50,
          //             ),
          //             SizedBox(width: 20),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Inzmam Malik",
          //                   style: TextStyle(fontSize: 14, color: Colors.black),
          //                 ),
          //                 Text(
          //                   "September 20,2023",
          //                   style: TextStyle(
          //                       fontSize: 12, color: Color(0xffBAC0C0)),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //         Text(
          //           "256SR",
          //           style: TextStyle(fontSize: 16, color: Color(0xff653780)),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20),
          // Container(
          //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey,
          //       blurRadius: 3,
          //       offset: Offset(1.0, 2.0),
          //     )
          //   ]),
          //   height: 90,
          //   width: MediaQuery.of(context).size.width,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   image: DecorationImage(
          //                       image: AssetImage("assets/pic.png.webp"),
          //                       fit: BoxFit.cover),
          //                   borderRadius: BorderRadius.circular(100),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         color: Colors.grey,
          //                         blurRadius: 3,
          //                         offset: Offset(1.0, 2.0))
          //                   ]),
          //               height: 50,
          //               width: 50,
          //             ),
          //             SizedBox(width: 20),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Inzmam Malik",
          //                   style: TextStyle(fontSize: 14, color: Colors.black),
          //                 ),
          //                 Text(
          //                   "September 20,2023",
          //                   style: TextStyle(
          //                       fontSize: 12, color: Color(0xffBAC0C0)),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //         Text(
          //           "256SR",
          //           style: TextStyle(fontSize: 16, color: Color(0xff653780)),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20),
          // Container(
          //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey,
          //       blurRadius: 3,
          //       offset: Offset(1.0, 2.0),
          //     )
          //   ]),
          //   height: 90,
          //   width: MediaQuery.of(context).size.width,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   image: DecorationImage(
          //                       image: AssetImage("assets/pic.png.webp"),
          //                       fit: BoxFit.cover),
          //                   borderRadius: BorderRadius.circular(100),
          //                   boxShadow: [
          //                     BoxShadow(
          //                         color: Colors.grey,
          //                         blurRadius: 3,
          //                         offset: Offset(1.0, 2.0))
          //                   ]),
          //               height: 50,
          //               width: 50,
          //             ),
          //             SizedBox(width: 20),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Inzmam Malik",
          //                   style: TextStyle(fontSize: 14, color: Colors.black),
          //                 ),
          //                 Text(
          //                   "September 20,2023",
          //                   style: TextStyle(
          //                       fontSize: 12, color: Color(0xffBAC0C0)),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ),
          //         Text(
          //           "256SR",
          //           style: TextStyle(fontSize: 16, color: Color(0xff653780)),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
