import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/input_page.dart';
import 'package:bmicalculator/reuseableCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultsPage extends StatelessWidget {
  final String bmiresult;
  final String resultText;
  final String interpretation;
  ResultsPage(
      {super.key,
      required this.bmiresult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' BMI CALCULATOR '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            child: const Text(
              'Your Result',
              style: titletextstyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: reuseablecard(
                onPress: () {},
                colour: activecardcolor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: resulttextstyle,
                      ),
                      Text(
                        bmiresult,
                        style: kbmiresult,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: bodytextstyle,
                      ),
                    ]),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                child: Center(
                  child: Text(
                    'Restart',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                color: const Color(0xFFEB1555),
                margin: const EdgeInsets.only(top: 8),
                width: double.infinity,
                height: bottomContainerHeight),
          )
        ],
      ),
    );
  }
}
