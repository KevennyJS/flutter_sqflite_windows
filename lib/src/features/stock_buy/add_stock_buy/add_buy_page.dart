import 'package:flutter/material.dart';

class AddBuyPage extends StatefulWidget {
  const AddBuyPage({Key? key}) : super(key: key);

  @override
  State<AddBuyPage> createState() => _AddBuyPageState();
}

class _AddBuyPageState extends State<AddBuyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Stock Buy'),
      ),
      body: const Center(
        child: Text('Add Stock Buy'),
      ),
    );
  }
}
