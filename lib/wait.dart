import 'package:flutter/material.dart';

class waiting extends StatelessWidget {
  List<Widget> tabs = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Drawer(
        child: DecoratedBox(
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.red),
        ),
      ),
    );
  }
}
