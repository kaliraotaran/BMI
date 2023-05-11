import 'package:bmicalculator/calculator.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reuseableCard.dart';

const activecardcolor = Color(0xFF1D1E33);
const bottomContainerHeight = 80.00;
const inactivcardcolor = Color(0xFFF111328);

const cardtextStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);
const labeltextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender = Gender.female;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: reuseablecard(
                      cardChild: Iconswidget(
                        gender: 'Male',
                        icons: FontAwesomeIcons.mars,
                      ),
                      colour: selectedgender == Gender.male
                          ? activecardcolor
                          : inactivcardcolor,
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                    ),
                  ),

                  //----------------------------------------

                  Expanded(
                      child: reuseablecard(
                    cardChild: Iconswidget(
                        gender: 'Female', icons: FontAwesomeIcons.venus),
                    colour: selectedgender == Gender.female
                        ? activecardcolor
                        : inactivcardcolor,
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                  ))
                ],
              ),
            ),

            //----------------------------------------
            Expanded(
              child: reuseablecard(
                colour: activecardcolor,
                cardChild: Column(children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'HEIGHT',
                    style: labeltextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: cardtextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labeltextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 20)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: const Color(0xFF8D8E98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ]),
                onPress: () {
                  print('hello');
                },
              ),
            ),

            //----------------------------------------

            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: reuseablecard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: labeltextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: cardtextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: activecardcolor,
                    onPress: () {
                      print('hello');
                    },
                  ),
                ),

                //----------------------------------------

                Expanded(
                    child: reuseablecard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Age',
                        style: labeltextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: cardtextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(
                            width: 40,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                  colour: activecardcolor,
                  onPress: () {},
                ))
              ],
            )),

            //----------------------------------------

            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiresult: calc.calculateBMI(),
                              resultText: calc.getresult(),
                              interpretation: calc.getinterpretation(),
                            )));
              },
              child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  color: const Color(0xFFEB1555),
                  margin: const EdgeInsets.only(top: 8),
                  width: double.infinity,
                  height: bottomContainerHeight),
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});
  final IconData icon;
  final VoidCallback
      onPress; // instead of using Function here, we used voidcallback
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPress,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
