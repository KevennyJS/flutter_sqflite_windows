import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String title;
  final String? route;

  const CardMenu({Key? key, required this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: Text(title, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
