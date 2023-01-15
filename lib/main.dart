import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/features/client/edit_client/edit_client_page.dart';
import 'package:flutter_sqflite_windows/src/features/menu/menu_database/menu_database_page.dart';

import 'src/features/client/client_list/client_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClientListPage(),
      routes: {
        '/edit_client': (context) => const EditClientPage(),
        '/client_list': (context) => const ClientListPage(),
        '/menu_database': (context) => const MenuDatabasePage(),
      },
    );
  }
}
