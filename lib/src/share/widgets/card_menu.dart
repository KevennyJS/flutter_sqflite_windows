import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String title;
  final Widget? screenRoute;

  const CardMenu({Key? key, required this.title, this.screenRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screenRoute!,
          ),
        );
      },
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
