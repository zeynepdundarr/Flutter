import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(Test());

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1D1E33),
          scaffoldBackgroundColor: Color(0xFF1D1E33)),
      home: Container(child: IconTemp(icoan: FontAwesomeIcons.mars, label: "Male")),
    );
  }
}

class IconTemp extends StatelessWidget {

  final IconData icoan;
  final String label;

  const IconTemp({
    this.icoan, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icoan, size: 80.0,color: Colors.black,),
      SizedBox(height: 15.0),
      Text(label, style: TextStyle(fontSize: 18.0, color: Colors.grey)),
    ]);
  }
}

