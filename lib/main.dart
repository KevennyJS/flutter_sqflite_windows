import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/features/client/edit_client/edit_client_page.dart';
import 'package:flutter_sqflite_windows/src/features/home/home.dart';
import 'src/features/client/client_list/client_list_view.dart';
import 'src/features/client/client_menu/client_menu_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/menu',
      debugShowCheckedModeBanner: false,
      home: BaseView(),
    );
  }
}
