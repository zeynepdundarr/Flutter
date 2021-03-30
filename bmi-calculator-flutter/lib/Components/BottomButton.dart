
import 'package:flutter/cupertino.dart';

import '../Constants/Constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Center(
              child: Text(buttonTitle, style:  kLargeButtonTextStyle)),
          height: kBottomContainerHeight,
          width: double.infinity,
          color: kBottomColor,
          margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),),
    );
  }
}
