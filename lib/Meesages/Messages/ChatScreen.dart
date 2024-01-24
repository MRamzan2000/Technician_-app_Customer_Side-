import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  final String myUserId;
  final String otherUserId;
  final String name;

  const ChatScreen({Key? key, required this.myUserId, required this.otherUserId,required this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool isConnected = false;
  String roomId=" ";
  late IO.Socket socket;
  int _page = 1;
  bool _isLoading = false;
  List<Map<dynamic, dynamic>> _messages = [];
  final _scrollController = ScrollController();

  String _lastMessageId = '';

  Future<void> _loadMessages() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await http.get(
          Uri.parse('https://dolphin-app-toqsg.ondigitalocean.app/messages/${widget.myUserId}/${widget.otherUserId}/$_page'),
          // Uri.parse('https://dolphin-app-ldyyx.ondigitalocean.app/messages/${widget.myUserId}/${widget.otherUserId}/$_page'),
          headers: {"Content-Type": "application/json"},
        );
        final data = jsonDecode(response.body);
        final List<Map<String, dynamic>> messages =
        List<Map<String, dynamic>>.from(data['messages']);

        // Check if we received any new messages
        if (messages.isNotEmpty) {
          setState(() {
            _messages.addAll(messages.map((message) {
              return Map<String, String>.from(message.map(
                    (key, value) => MapEntry(key, value.toString()),
              ));
            }).where((message) => !_messages.any((existingMessage) => existingMessage['_id'] == message['_id'])));
            _messages.sort((a, b) => b['createdAt']!.compareTo(a['createdAt'].toString()));
            _lastMessageId = messages.last['_id'];
            _isLoading = false;
            _page++;
          });
        } else {
          // If we didn't receive any new messages, stop loading more messages
          setState(() {
            _lastMessageId = messages.last['_id'];
            _isLoading = false;
            _page++;
          });
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void connectToServer() async{
    try {
      print("Connecting");
      // Configure socket transports must be specified
      socket = IO.io('https://dolphin-app-toqsg.ondigitalocean.app/',IO.OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
      // socket = IO.io('https://dolphin-app-ldyyx.ondigitalocean.app/',IO.OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());

      socket.onConnect((_) {
        print('Connected');
      });

      socket.onConnectError((error) {
        print('Connection error: $error');
      });

      socket.onDisconnect((_) => print('Disconnected'));

    } catch (e) {
      print("hello");
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    connectToServer();
    _loadMessages();
    _scrollController.addListener(_scrollListener);
    if (widget.myUserId.compareTo(widget.otherUserId) < 0) {
      roomId = '${widget.myUserId}${widget.otherUserId}';
    } else {
      roomId = '${widget.otherUserId}${widget.myUserId}';
    }
    socket.emit('join', roomId );
    socket.onConnect((data) {
      print('Connected to socket');
      isConnected = true;
    });
    socket.onDisconnect((data) {
      print('Disconnected from socket');
      isConnected = false;
    });
    socket.connect();
    socket.on('message', _handleIncomingMessage);
  }
  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMessages();
    }
  }
  File selectedImage = File('');

  @override
  void dispose() {
    socket.off('message', _handleIncomingMessage);
    super.dispose();
  }

  void _handleIncomingMessage(data) {
    print("Coming:$data");
    setState(() {
      Map<String, String> message = {
        'senderId': data['senderId'],
        'receiverId': data['receiverId'],
        'text': data['text'].toString(),
        'type':data['type'].toString(),
        'image':data['image'].toString()
      };
      print(message);
      if(message['senderId']!=widget.myUserId){
        _messages.insert(0, message);
      }
    });
  }
  String? Url;

  // String base64Image = "";
  Future<void> _sendMessage() async {
    String text = _messageController.text.trim();
    try{
      var imageUploadRequest = http.MultipartRequest('POST', Uri.parse("https://dolphin-app-toqsg.ondigitalocean.app/upload"));
      // var imageUploadRequest = http.MultipartRequest('POST', Uri.parse("https://dolphin-app-ldyyx.ondigitalocean.app/upload"));
      imageUploadRequest.files.add(await http.MultipartFile.fromPath("image", selectedImage.path));
      http.StreamedResponse response =   await imageUploadRequest.send();
      final String res=await response.stream.bytesToString();
      Map<String, dynamic> jsonData = json.decode(res) as Map<String, dynamic>;
      Url = jsonData["message"];
    }
    catch(e){
      print(e);
    }
    if (isConnected==true) {
      Map<dynamic, dynamic> message = {
        'senderId': widget.myUserId,
        'receiverId': widget.otherUserId,
        'text':  text ,
        'roomId':roomId,
        "type" : selectedImage.path == "" ? "text" : "image",
        "image" : selectedImage.path == "" ? "" : Url
      };


      print("hello$message");
      // print("image: "+base64Image.toString(), );
      socket.emit('message', message,);

      setState(() {
        // Add the new message to the beginning of the list
        _messages.insert(0, message);
      });

      _messageController.clear();
      selectedImage = File("");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
            height: 60,
            child: Stack(children: [
              Align(
                alignment: Alignment.centerLeft,
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
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                            widget.name,
                            style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 6),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/profile.png")),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff2F62BB),
                          blurRadius: 2,
                        )
                      ]),
                  height: 50,
                  width: 50,
                ),
              ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                Map<dynamic, dynamic> message = _messages[index];
                bool isMyMessage = message['senderId'].toString()== widget.myUserId;
                final alignment = isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start;
                final messageColor = isMyMessage ? Colors.black : Colors.white;
                String? url;
                if(_messages[index]['type']=="image"){
                  url=_messages[index]['image'];
                  print("https://dolphin-app-toqsg.ondigitalocean.app//image/$url");
                  // print("https://dolphin-app-ldyyx.ondigitalocean.app//image/$url");
                }
                return Row(
                  mainAxisAlignment: alignment,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              isMyMessage?Container():Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/profile.png")),
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff2F62BB),
                                        blurRadius: 2,
                                      )
                                    ]),
                                height: 30,
                                width: 30,
                              ),
                              Row(
                                children: [
                              _messages[index]['type']=='text'?Container(
                                    decoration: BoxDecoration(
                                      color: isMyMessage?const Color(0xffE2E2E2):const Color(0xff9C3587),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${_messages[index]['text']}",
                                          maxLines: 8, // Change this value as needed
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12, color: messageColor),
                                        )
                                      ),
                                    ),
                                  ):
                              Container(
                                decoration: BoxDecoration(
                                  color: isMyMessage?const Color(0xffE2E2E2):const Color(0xff9C3587),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2,
                                child: InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              content: SizedBox(
                                                  height: 340,width: 170,
                                                  child:
                                                  Image.network("https://dolphin-app-toqsg.ondigitalocean.app/image/$url",
                                                  // Image.network("https://dolphin-app-ldyyx.ondigitalocean.app/image/$url",
                                                    fit: BoxFit.cover,))),
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text("VIEW IMAGE"),
                                  ),
                                ),
                              ),
                                  const SizedBox(width: 10,)
                                ],
                              ),
                              const SizedBox(width: 10)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1.0, 2.0))
                        ]),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          // prefix: InkWell(
                          //   onTap: () async {
                          //     final ImagePicker picker = ImagePicker();
                          //     final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
                          //     if (photo != null) {
                          //       setState(() {
                          //         selectedImage = File(photo.path);
                          //       });
                          //
                          //       // Read the image file as bytes
                          //       List<int> imageBytes = await selectedImage.readAsBytes();
                          //
                          //       // Convert the image bytes to a base64-encoded string
                          //        base64Image = base64Encode(imageBytes);
                          //       _sendMessage();
                          //
                          //       // Use the base64Image as needed, for example, sending it to a server or displaying it in your UI
                          //       print(base64Image);
                          //     }
                          //   },
                          //   child: Icon(Icons.camera_alt),
                          // ),
                            contentPadding: const EdgeInsets.only(bottom: 17, left: 10),
                            border: InputBorder.none,
                            hintText: " أرسل نص أو صورة",
                            hintStyle:
                            const TextStyle(fontSize: 10, color: Color(0xff97AABD)),
                            suffixIcon: IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send),

                            )),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: ()async {
                      showModalBottomSheet(context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  new ListTile(
                                    leading: new Icon(Icons.camera),
                                    title: new Text('Camera'),
                                    onTap: () {
                                      getImageByCamera();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  new ListTile(
                                    leading: new Icon(Icons.image),
                                    title: new Text('Gallery'),
                                    onTap: () {
                                      getImageByGallery();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                      );

                }, icon: const Icon(Icons.camera_alt)),

              ],
            ),
          )
        ],
      ),
    );
  }
  Future getImageByCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        selectedImage = File(photo.path);
      });
      _sendMessage();
    }
  }

  Future getImageByGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        selectedImage = File(photo.path);
      });
      _sendMessage();
    }
  }
}