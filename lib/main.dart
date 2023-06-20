import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'internal/helpers/firebase_options.dart';
import 'internal/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
