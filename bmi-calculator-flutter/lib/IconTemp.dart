import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTemp extends StatelessWidget {

  final IconData icon;
  final String label;

  const IconTemp({
    this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 80.0,color: Colors.white),
      SizedBox(height: 15.0),
      Text(label, style: TextStyle(fontSize: 18,fontFamily: "Raleway", color: Colors.grey)),
    ]);
  }
}