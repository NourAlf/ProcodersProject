

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        gradient: LinearGradient(
          colors: [Colors.blue,Colors.blueGrey],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),),
      child:  TextButton(
        onPressed: onPressed,
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 50),
          child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}