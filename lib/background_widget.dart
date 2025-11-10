import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, // garante que ocupe toda a altura da tela
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Tela Inicial (1).png'),
          fit: BoxFit.cover, // cobre toda a área disponível
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
