import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateEvent extends StatefulWidget {
  static const String id = 'create_event';
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  DateTime _date = DateTime(2020, 11, 17);
  void _selectDate() async {
    final DateTime newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
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
      height: 100.0,
      child: ElevatedButton(
          child: Text('Select Date'),
          onPressed: () {
            _selectDate();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create an Event"),
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
        onPressed: () {
          // Navigator.pushNamed(context, DatePicker.id);
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
      body: Container(),
    );
  }
}
