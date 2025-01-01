import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/servis_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const App());
}
