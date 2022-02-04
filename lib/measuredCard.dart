import 'dart:html';

import 'package:flutter/material.dart';
import 'package:workshop3/roundButton.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({ Key? key,
  required this.measure,
  required this.unit,
  required this.title,
  required this.increament,
  required this.decreament,
  }) : super(key: key);

  final String title;
  final int measure;
  final String unit;
  final void Function() increament;
  final void Function() decreament;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(measure.toString(),
            style: TextStyle(
              fontSize:40,
              fontWeight: FontWeight.bold,
            ),),
            Text( unit),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(content: '-', onPress: decreament),
            RoundButton(content: '+', onPress: increament),
          ],

        )
      ],
    );
  }
}