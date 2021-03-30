
import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final cardChild;
  final Function onPress;


  const ReusableCard({

    @required this.color,
    @required this.cardChild,
    @required this.onPress,


});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
    child: Container(child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    );

  }
}
