import 'package:flash_chat/screens/forgot_password_screen.dart';
import 'package:flash_chat/screens/homeApp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String _email;
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
                  height: 48.0,
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
                  onSaved: (input) {
                    _email = input;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
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
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password should contain atleast five characters";
                    }
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  onSaved: (input) {
                    _password = input;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Enter your password.',
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
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: signIn,
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 200.0),
                  child: GestureDetector(
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontSize: 18.0,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPasswordScreen.id);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      setState(() {
        showSpinner = true;
      });
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushNamed(context, HomeApp.id);
      } catch (e) {
        print(e);
        setState(() {
          showSpinner = false;
        });
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                  title: new Text("Incorrect Password"),
                  content: new Text("The password you entered was invalid"),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'Reset Password!',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, ForgotPasswordScreen.id);
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Try Again!',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
      }
    } else {
      setState(() {
        showSpinner = false;
      });
    }
  }
}
