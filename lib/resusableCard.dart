import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  const ResusableCard({Key? key, 
  required this.cardChild,
  required this.onPress,
  }) : super(key: key);

  final Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.lightBlue[900],
              borderRadius: BorderRadius.circular(15),
            ),
            child: cardChild,
            ),
      ),
    );
  }
}
