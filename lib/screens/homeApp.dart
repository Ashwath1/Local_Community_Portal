import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/create_event.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/join_event.dart';

class HomeApp extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
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

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // Navigator.pushNamed(context, DatePicker.id);
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 26.0,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 40.0),
                  child: TypewriterAnimatedTextKit(
                    text: ['Welcome!'],
                    textStyle: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 50.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CreateEvent.id);
                      },
                      child: Text(
                        'Create an Event',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, JoinEvent.id);
                      },
                      child: Text(
                        'Join an Event',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
