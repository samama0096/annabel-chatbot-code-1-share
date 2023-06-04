import 'package:chatbot/views/ui/splashview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    home: const SplashView(),
    theme: ThemeData(useMaterial3: false),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
  ));
}
