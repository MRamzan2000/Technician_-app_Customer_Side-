import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Models/Messages.dart';
import 'ChatScreen.dart';
class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String? id="";
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      getActiveOrders();
    });
    setState(() {
      initialize();
    });
  }
  final StreamController<LastMessages> _streamController = StreamController();
  @override
  void dispose() {
    super.dispose();
    // stop streaming when app close
    _streamController.close();
  }
  void initialize()async{
    final prefs = await SharedPreferences.getInstance();
    id= prefs.getString('id');
    setState(() {

    });
  }

  Future<void> getActiveOrders() async{
    LastMessages dataModel = await fetchLastMessages(id.toString());
    setState(() {
    });
    _streamController.sink.add(dataModel);
  }

  Future<LastMessages> fetchLastMessages(String senderId) async {
    final response = await http.get(
      // Uri.parse('https://dolphin-app-ldyyx.ondigitalocean.app/receivers/$id'),
      Uri.parse('https://dolphin-app-toqsg.ondigitalocean.app/receivers/$id'),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final transformedJson = transformLastMessagesResponse(response.body);
      final lastMessages = LastMessages.fromJson(transformedJson);
      print(lastMessages);
      return lastMessages;
    } else {
      throw Exception('Failed to load last messages');
    }
  }


  Map<String, dynamic> transformLastMessagesResponse(String responseBody) {
    final jsonMap = jsonDecode(responseBody);
    final List<Map<String, dynamic>> messagesList = [];

    for (final entry in jsonMap['lastMessages'].entries) {
      final receiverId = entry.key;
      final messageData = entry.value;
      final messageMap = {
        'receiverId': receiverId,
        '_id': messageData['_id'],
        'text': messageData['text'],
        'createdAt': messageData['createdAt'],
        'receiverName': messageData['receiverName'],
      };
      messagesList.add(messageMap);
    }

    return {'lastMessages': messagesList};
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xffF89F5B),
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
              width: MediaQuery.of(context).size.width / 2.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Container(
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(100),
                    //       ),
                    //       height: 20,
                    //       width: 20,
                    //       child: SvgPicture.asset(
                    //         "assets/Back Arrow.svg",
                    //         fit: BoxFit.scaleDown,
                    //       )),
                    // ),
                    Text(
                      "الرسائل",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(32),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Colors.grey,
          //             blurRadius: 3,
          //             offset: Offset(1.0, 2.0))
          //       ]),
          //   height: 40,
          //   width: MediaQuery.of(context).size.width / 1.1,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       border: InputBorder.none,
          //       contentPadding: EdgeInsets.only(bottom:5,left: 20),
          //       // prefixIcon: SvgPicture.asset(
          //       //   "assets/Search box.svg",
          //       //   fit: BoxFit.scaleDown,
          //       // ),
          //       hintText: "Search Now",
          //       hintStyle: TextStyle(fontSize: 15, color: Color(0xff97AABD)),
          //     ),
          //   ),
          // ),
          StreamBuilder<LastMessages>(
            stream: _streamController.stream,
            builder: (context,snapdata){
              switch(snapdata.connectionState){
                case ConnectionState.waiting: return const Center(child: CircularProgressIndicator(),);
                default: if(snapdata.hasError){
                  return const Text('Please Wait....');

                }
                if(snapdata.data!.messages.isEmpty ){
                  return const Center(child: Text("لا توجد رسائل"),);
                }
                else {
                  final chats = snapdata.data!.messages;
                  chats.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
                  return Expanded(
                      child: ListView.builder(
                          itemCount: chats.length,
                          itemBuilder: (context, index){
                            final timestamp = chats[index].createdAt;
                            print(timestamp);
                            // final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse( timestamp!));
                            // final formattedDateTime = DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () async{
                                  // print(chats[index].receiverName);

                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (BuildContext context) {
                                    return ChatScreen(myUserId: id.toString(),otherUserId: (chats[index].receiverId).toString(), name: chats[index].receiverName.toString(),);
                                  }));

                                  // print("object:  " +  (chats[index].receiverId).toString());
                                },
                                child: Container(
                                  decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 2.0))
                                  ]),
                                  height: 85,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 3),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            timestamp!.substring(0 , 10),
                                            style:
                                            const TextStyle(fontSize: 12, color: Color(0xff3D3D3D)),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage("assets/profile.png")),
                                                  borderRadius: BorderRadius.circular(100),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0xff2F62BB),
                                                      blurRadius: 2,
                                                    )
                                                  ]),
                                              height: 50,
                                              width: 50,
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${chats[index].receiverName}",
                                                  style: const TextStyle(
                                                      fontSize: 16, color: Color(0xff3D3D3D)),
                                                ),
                                                Text(
                                                  "${chats[index].text}",
                                                  style:
                                                  const TextStyle(fontSize: 12, color: Colors.black),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}