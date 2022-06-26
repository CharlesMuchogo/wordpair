// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text('Wordpair'),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Homepage(),
    ),
  ));
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var CurrentPair = WordPair.random();

  List<String> words = [''];

  void change() {
    setState(() {
      words.add(CurrentPair.asString);
      CurrentPair = WordPair.random();
    });
  }

  void delete() {
    setState(() {
      words.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
          child: ListView(
            children: [
              ElevatedButton(
                    onPressed: delete,
                    child: Text(
                      'clear the wordlist',
                    ),
                  ),
              SizedBox(
                height: 20,
              ),
              Text(
                CurrentPair.asLowerCase,
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                    onPressed: change,
                    child: Text(
                      'Change word',
                    ),
                  ),
                  
                  
                
              
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: words
                        .map(
                          (word) => Text(
                            word,
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
