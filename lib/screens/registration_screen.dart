import 'package:flash_chat/screens/homeApp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _fullName;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'local_community',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/local_community.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please enter name';
                    }
                  },
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.center,
                  onSaved: (input) {
                    _fullName = input;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(input)) {
                      return "Please enter valid email";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.center,
                  onSaved: (input) {
                    _email = input;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password should contain atleast five characters";
                    }
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  textAlign: TextAlign.center,
                  onSaved: (input) {
                    _password = input;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: createUser,
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUser() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        showSpinner = true;
      });
      formState.save();
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        Navigator.pushNamed(
          context,
          HomeApp.id,
        );
      } catch (e) {
        print(e);
        setState(() {
          showSpinner = false;
        });
      }
    } else {
      setState(() {
        showSpinner = false;
      });
    }
  }
}
