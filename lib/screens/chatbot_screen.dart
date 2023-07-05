import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:untitled/screens/main_screen.dart';
import '../constant/color.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class chatScreen extends StatefulWidget {
  const chatScreen({Key? key}) : super(key: key);

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final http.Client _client = http.Client();
  final List<String> _data = [];
  final url = Uri.parse('http://192.168.1.2:3000/');

  final TextEditingController _queryController = TextEditingController();

  @override
  void dispose() {
    _client.close(); // Close the client when the widget is disposed
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const MainScreen(),
              ),
            );
          },
          child: const Icon(
              color: Colors.deepPurple,
              Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
        title:  GradientText(
          "Chatbot",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          colors: [
            firstMainColor,
            secondMainColor,
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedList(
              // key to call remove and insert from anywhere
                key: _listKey,
                initialItemCount: _data.length,
                itemBuilder:
                    (BuildContext context, int index, Animation animation) {
                  return _buildItem(_data[index], animation, index);
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextField(
              decoration:  InputDecoration(
                fillColor: Colors.black,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.message,
                    color: secondMainColor,
                  ),
                ),
                hintText: "Write a message",
              ),
              controller: _queryController,
              textInputAction: TextInputAction.send,
              onSubmitted: (msg) {
                _getResponse();
              },
            ),
          )

        ],
      ),
    );
  }


  void _getResponse() async {
    if (_queryController.text.isNotEmpty) {
      _insertSingleItem(_queryController.text);
      try {
        final response = await http.post(
          url,
          body: jsonEncode({'message': _queryController.text}),
          headers: {'Content-Type': 'application/json'},
        );
        if (kDebugMode) {
          print('Response: ${response.body}');
        }
        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          _insertSingleItem(data['response'] + "<bot>");
        } else {
          throw Exception('Failed to get chatbot response.');
        }
      } catch (e) {
        if (kDebugMode) {
          print("Failed -> $e");
        }
      }
    }
  }


  void _insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState?.insertItem(_data.length - 1);
  }

  Widget _buildItem(String item, Animation animation, int index) {
    bool mine = item.endsWith("<bot>");
    return SizeTransition(
        sizeFactor: kAlwaysCompleteAnimation,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              alignment: mine ? Alignment.topLeft : Alignment.topRight,
              child: Bubble(
                color: mine ? Colors.blue : Colors.indigo,
                padding: const BubbleEdges.all(10),
                child: Text(
                    item.replaceAll("<bot>", ""),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    )
                ),
              )
          ),
        )
    );
  }
}
