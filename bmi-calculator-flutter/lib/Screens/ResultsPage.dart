import 'package:bmi_calculator/Components/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/Components/BottomButton.dart';
import 'package:bmi_calculator/Constants/Constants.dart';
import 'package:bmi_calculator/Screens/InputPage.dart';


class ResultsPage extends StatelessWidget{

  ResultsPage({ @required this.bmiAdvice,
    @required this.bmiResult,
    @required this.bmiClassify,
  });
  final String bmiAdvice;
  final String bmiResult;
  final String bmiClassify;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR", style: kLabelTextStyle),
      ),
      body: Center(child: Column(

        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        crossAxisAlignment : CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40,width: 15,),
          Expanded(
            child:Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: kLabelResultTitleStyle),
          ),),

          Expanded(
            flex:5,
            child:ReusableCard(
              onPress: (){},
            color: kPassiveButtonColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment : CrossAxisAlignment.center,
                children: [
                Text(bmiResult, style: kLabelResultStyle),
                Text(bmiClassify, style: kLabelClassificationStyle),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(bmiAdvice, style: kLabelAdviceStyle),
                ),
              ],),
          ),),
          BottomButton(
            buttonTitle: "Re-Calculate BMI",
            onTap: (){

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return InputPage();
                },),);},
          ),
        ],
      ),),
    );
  }

}

