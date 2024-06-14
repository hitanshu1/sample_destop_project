import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'Controllers/controllerBinding.dart';
import 'UI/DashBoard/DashBoard.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ControllersBinding.initialize();
  runApp(const MyApp());
}
/// main  Widget of app
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Dashboard - STORE 01',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const DashBoardPage(),
      ),
    );
  }
}
