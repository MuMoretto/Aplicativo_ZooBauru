import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:zoobaurumap/background_widget.dart';
import 'package:zoobaurumap/screens/tela_comecar.dart';
import 'package:zoobaurumap/screens/tela_historia.dart';
import 'package:zoobaurumap/screens/tela_sobre.dart';
import 'package:zoobaurumap/screens/tela_creditos.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: BackgroundWidget(
          child: Stack(
            children: [
              // Título
              Positioned(
                top: height * 0.08,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Bem-Vindo ao',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: 'Bangers',
                        letterSpacing: 3.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Zoo Bauru',
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Bangers',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF02520D),
                        letterSpacing: 5.0,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Botões
              Positioned(
                top: height * 0.24,
                left: width * 0.05,
                right: width * 0.05,
                child: Column(
                  children: [
                    AnimatedButton(
                      text: 'Começar',
                      destination: TelaComecar(),
                    ),
                    SizedBox(height: 30),
                    AnimatedButton(
                      text: 'História do Zoológico',
                      destination: TelaHistoria(),
                    ),
                    SizedBox(height: 30),
                    AnimatedButton(
                      text: 'Sobre o Aplicativo',
                      destination: TelaSobre(),
                    ),
                    SizedBox(height: 30),
                    AnimatedButton(
                      text: 'Créditos',
                      destination: TelaCreditos(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final String text;
  final Widget destination;

  const AnimatedButton({
    required this.text,
    required this.destination,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget.destination),
    );
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: Material(
        color: Color(0xFF02520D),
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        shadowColor: Colors.black54,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          child: Container(
            width: double.infinity,
            height: 80,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              widget.text,
              style: TextStyle(
                fontFamily: 'Bangers',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}