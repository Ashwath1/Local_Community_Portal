import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/forgot_password_screen.dart';
import 'package:flash_chat/screens/create_event.dart';
import 'package:flash_chat/screens/join_event.dart';
import 'package:flash_chat/screens/homeApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/date_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: RegistrationScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        HomeApp.id: (context) => HomeApp(),
        DatePicker.id: (context) => DatePicker(),
        CreateEvent.id: (context) => CreateEvent(),
        JoinEvent.id: (context) => JoinEvent(),
      },
    );
  }
}
