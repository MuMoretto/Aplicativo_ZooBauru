import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String? text;
  final String title;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final Widget? customChild;

  const TextBox({
    this.text,
    this.title = '',
    this.fontSize = 20,
    this.backgroundColor = const Color(0xFF1B5E20),
    this.textColor = Colors.white,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 600,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize + 4,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    letterSpacing: 1.2,
                    fontFamily: 'Bangers',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (title.isNotEmpty) SizedBox(height: 16),
            customChild ??
                Text(
                  text ?? '',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
          ],
        ),
      ),
    );
  }
}