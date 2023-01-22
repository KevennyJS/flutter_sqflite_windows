import 'package:flutter/material.dart';

class ClientMenuView extends StatelessWidget {
  const ClientMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu'),centerTitle: true,elevation: 0),
    );
  }
}
