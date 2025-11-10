import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Positioned(
      top: 16,
      left: 16,
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}