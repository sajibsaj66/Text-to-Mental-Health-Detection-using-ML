
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('doctor')
        .where('specialist ', isEqualTo: query)
        .get();

        // arrayContains
     

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding:const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search',
              ),
              onChanged: (query) {
                searchFromFirebase(query);
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: searchResult.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResult[index]["name"]),
                subtitle: Text(
                  'Contact : +${searchResult[index]["contact"]}'
                  
                  ) ,
                
              );
            },
          )),
        ],
      ),
    );
  }
}
