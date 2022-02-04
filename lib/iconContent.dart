import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.icon,
    required this.title,
    required this.active,
    
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        size: 50,
        color: active ? Colors.white : Colors.blueGrey,
      ),
      Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.blueGrey,
        ),
      ),
    ]);
  }
}
