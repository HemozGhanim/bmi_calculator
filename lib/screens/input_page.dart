import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/rounded_button.dart';
import 'package:bmi_calculator/fuctionality/calulator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/constens.dart';

const MaleText = 'MALE';
const FemaleText = 'FEMALE';
enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int userHeight = 130;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ReusableCard(
                            onPress: () {
                              setState(() {
                                selectedGender = GenderType.male;
                              });
                            },
                            colour: selectedGender == GenderType.male
                                ? kactiveCardColor
                                : kinactiveCardColor,
                            cardChild: Iconcontent(
                                iconName: FontAwesomeIcons.mars,
                                gender: MaleText)),
                      ),
                      Expanded(
                          child: ReusableCard(
                              onPress: () {
                                setState(() {
                                  selectedGender = GenderType.female;
                                });
                              },
                              colour: selectedGender == GenderType.female
                                  ? kactiveCardColor
                                  : kinactiveCardColor,
                              cardChild: Iconcontent(
                                  iconName: FontAwesomeIcons.venus,
                                  gender: FemaleText))),
                    ],
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {},
                  colour: kactiveCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HIGHT',
                          style: klableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              userHeight.toString(),
                              style: knumbersTextStye,
                            ),
                            Text('cm')
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25.0),
                              thumbColor: kBottomContainerColor,
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29EB1555),
                              inactiveTrackColor: Color(0xFF8D8E98),
                              valueIndicatorColor: kBottomContainerColor),
                          child: Slider(
                            value: userHeight.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            label: '$userHeight',
                            divisions: 100,
                            onChanged: (double newValue) {
                              setState(() {
                                userHeight = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ReusableCard(
                        onPress: () {},
                        colour: kactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: klableTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: knumbersTextStye,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RuoundedFloatButton(
                                  ontap: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  tagName: 'minusWeight',
                                  iconName: FontAwesomeIcons.minus,
                                ),
                                RuoundedFloatButton(
                                  ontap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  tagName: 'addWeight',
                                  iconName: FontAwesomeIcons.plus,
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                      Expanded(
                          child: ReusableCard(
                        onPress: () {},
                        colour: kactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: klableTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: knumbersTextStye,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RuoundedFloatButton(
                                  ontap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  tagName: 'minusAge',
                                  iconName: FontAwesomeIcons.minus,
                                ),
                                RuoundedFloatButton(
                                  ontap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  iconName: FontAwesomeIcons.plus,
                                  tagName: 'addAge',
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                BottomButton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {
                    CalculatorBrain bmiCal =
                        CalculatorBrain(height: userHeight, weight: weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  bmiResult: bmiCal.calculateBMI(),
                                  resultText: bmiCal.getResult(),
                                  interpretaion: bmiCal.getInterPretation(),
                                )));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
