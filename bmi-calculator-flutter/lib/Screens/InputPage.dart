import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/BottomButton.dart';
import 'package:bmi_calculator/Constants/Constants.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';
import 'package:bmi_calculator/Components/RoundIconButton.dart';
import 'package:bmi_calculator/Components/IconTemp.dart';
import 'package:bmi_calculator/Screens/InputPage.dart';
import 'package:bmi_calculator/Screens/ResultsPage.dart';
import 'package:bmi_calculator/Model/CalculatorBrain.dart';


enum genderType{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color femaleColor = kPassiveButtonColor;
  Color maleColor = kPassiveButtonColor;
  int height = 120 ;
  int weight = 20 ;
  double age = 20 ;
  CalculatorBrain cb;
  genderType selectedGender;

  _InputPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',style: kLabelTextStyle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child:
                ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = genderType.male;
                    });
                  },
                  cardChild: IconTemp(
                    icon: FontAwesomeIcons.mars,
                    label: "male",
                  ),
                  color: selectedGender == genderType.male
                      ? kActiveButtonColor
                      : kPassiveButtonColor,
                ),
                //child: Container(width: 10.0,height: 10.0, color: Colors.blue,)
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = genderType.female;
                    });
                  },
                  cardChild: IconTemp(
                    icon: FontAwesomeIcons.venus,
                    label: "female",
                  ),
                  color: selectedGender == genderType.female
                      ? kActiveButtonColor
                      : kPassiveButtonColor,
                ),
              )
            ]),
          ),

          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  color: kPassiveButtonColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Height ", style: kLabelTextStyle),
                      SizedBox(height: 20.0, width: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(" ${height.toString()} ",
                              style: kLabelNumberStyle),
                          Text(" cm ", style: kLabelTextStyle),
                        ],),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height as double,
                          min: 120,
                          max: 220,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),),
                    ],
                  ),
                ),
              )
            ]),
          ),
          Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: kLabelTextStyle),
                        Text(weight.toString(), style: kLabelNumberStyle),
                        SizedBox(height: 20.0, width: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus, onPressed: () {
                              setState(() {
                                weight --;
                              });
                            }
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus, onPressed: () {
                              setState(() {
                                weight ++;
                              });
                            }
                            ),

                          ],
                        ),
                      ],
                    ),
                    color: kPassiveButtonColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: kLabelTextStyle),
                        Text(age.toString(), style: kLabelNumberStyle),
                        SizedBox(height: 20.0, width: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus, onPressed: () {
                              setState(() {
                                age --;
                              });
                            }
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus, onPressed: () {
                              setState(() {
                                age ++;
                              });
                            }
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kPassiveButtonColor,
                  ),
                ),

              ])),
          BottomButton(
            buttonTitle: "Calculate BMI",
            onTap: (){
              cb = new CalculatorBrain(weight: weight, height: height);
              print("height weight and advice");
              print("{$height, $weight}"+"{$cb.getAdvice()}");
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ResultsPage(bmiResult: cb.calculateBMI(), bmiAdvice: cb.getAdvice(), bmiClassify: cb.classifyBMI());
                },),);},
          ),
        ],
      ),
    );
  }
//Create round icon box

}



