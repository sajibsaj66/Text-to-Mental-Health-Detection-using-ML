import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


import 'api_url.dart';

class MHomePage extends StatefulWidget {
  const MHomePage({super.key});

  @override
  State<MHomePage> createState() => _MHomePageState();
}

class _MHomePageState extends State<MHomePage> {
  String result = '';

  final TextEditingController _textController = TextEditingController();

  //api call

  getMentalhealthStatus(String text) async {
    log('ami assi');
    Response response =
        await post(Uri.parse('${Url.url}/predict'), body: {
      'app_text': text,
    });
    if (response.statusCode == 200) {
      var status = jsonDecode(response.body.toString());
      log(status);
      setState(() {
        result = status['mentalhealthstatus'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                log('clicked');
                getMentalhealthStatus(_textController.text);
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Text(
                    'Predict',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(result),
          ],
        ),
      ),
    );
  }
}
