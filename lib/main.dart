import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oioioi/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF1C1C1D),
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}
