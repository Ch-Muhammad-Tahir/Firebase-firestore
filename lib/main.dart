import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_firestore/firebase_options.dart';
import 'package:firebase_firestore/views/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: HomePageScreenWidget(),
  ));
}
