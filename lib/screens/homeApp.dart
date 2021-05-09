import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/create_event.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
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
  String name;
  String email;

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
      height: 200,
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Modal BottomSheet'),
          ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context).pop();
              },
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  {
                    FirebaseAuth.instance.signOut().then((onValue) {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    });
                  }
                }),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 72.0, vertical: 40.0),
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
