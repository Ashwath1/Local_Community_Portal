import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JoinEvent extends StatefulWidget {
  static const String id = 'join_event';
  @override
  _JoinEventState createState() => _JoinEventState();
}

class _JoinEventState extends State<JoinEvent> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Join an Event"),
        backgroundColor: Colors.greenAccent[400],
        elevation: 50.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Menu Icon',
          onPressed: () {
            Navigator.pop(context);
          },
        ), //
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[400],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Euphoria',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Euphoria',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Euphoria',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Euphoria',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Euphoria',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
