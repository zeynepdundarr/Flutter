import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconTemp.dart';
import 'ReusableCard.dart';
import 'Constants.dart';
import 'RoundIconButton.dart';

Color femaleColor = kPassiveButtonColor;
Color maleColor = kPassiveButtonColor;
double height = 20 ;
double weight = 20 ;


enum genderType{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  genderType selectedGender;

  _InputPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
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
                      print("hello gesture 1");
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
                          value: height,
                          min: 0,
                          max: 100,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round() as double;
                            });
                          },
                        ),),
                    ],
                  ),
                  color: kCardColor,
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
                    color: kCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: IconTemp(
                      icon: FontAwesomeIcons.weight,
                      label: "",
                    ),
                    color: kCardColor,
                  ),
                ),

              ])),
          Container(
              height: kBottomContainerHeight,
              width: kBottomContainerWidth,
              color: kBottomColor),
        ],
      ),
    );
  }
//Create round icon box

}




