import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workshop3/iconContent.dart';
import 'package:workshop3/resusableCard.dart';
import 'measuredCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //0 for male, 1 for female
  int selectedGender = 0;
  int weight = 50;
  int height = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.red[900],
      ),
      drawer: Drawer(child: 
      ListTile(leading: Icon(Icons.home,size:20),
      title: Text('previous calculation'),
      onTap: (){
        Navigator.of(context).pop();
      },
      )
      
      ),

      body: 
      
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Gender
          Row(
            children: [
              ResusableCard(
                  cardChild: IconContent(
                    icon: Icons.male,
                    title: 'Male',
                    active: (selectedGender == 0),
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = 0;
                    });
                  }),
              ResusableCard(
                  cardChild: IconContent(
                    icon: Icons.female,
                    title: 'Female',
                    active: (selectedGender == 1),
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = 1;
                    });
                  }),
            ],
          ),
          //Measurement
          Row(
            children: [
              ResusableCard(
                  cardChild: MeasureCard(
                    measure: weight,
                    unit: 'kg',
                    title: 'Weight',
                    increament: () {
                      setState(() {
                        weight++;
                      });
                    },
                    decreament: () {
                      setState(() {
                        weight > 0 ? weight-- : weight = 0;
                      });
                    },
                  ),
                  onPress: () {}),
              ResusableCard(
                  cardChild: MeasureCard(
                    measure: height,
                    unit: 'cm',
                    title: 'Height',
                    increament: () {
                      setState(() {
                        height++;
                      });
                    },
                    decreament: () {
                      setState(() {
                        height > 0 ? height-- : height = 0;
                      });
                    },
                  ),
                  onPress: () {}),
            ],
          ),
          //calculate
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              String bmiString = bmi.toStringAsFixed(2);
              print(bmiString);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        bmi < 18.5
                            ? 'Your BMI is $bmiString, UnderWeight.'
                            : bmi > 18.5 && bmi < 25.0
                                ? 'Your BMI is $bmiString, Healthy.'
                                : 'Your BMI is $bmiString, Odese.',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            final text =' Back Successfully!';
                            final snackBar=SnackBar(content: Text(text));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            Navigator.pop(context);
                          },
                          child: Text('Back'),
                        )
                      ],
                    );
                  });
            },
            child: Container(
                color: Colors.pink,
                width: double.infinity,
                height: 70,
                child: Center(
                  child: Text('Calculate',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
