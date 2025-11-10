import 'package:flutter/material.dart';
import '../background_widget.dart';
import 'package:zoobaurumap/screens/custom_back_button.dart';
import 'package:zoobaurumap/screens/text_box.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF1B5E20)),
                iconSize: 32,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.09,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 700,
                    maxHeight: MediaQuery.of(context).size.height * 0.58,
                  ),
                  child: TextBox(
                    title: 'Sobre o Aplicativo',
                    text: 'O aplicativo "Zoo Bauru" foi desenvolvido com o objetivo de aproximar o público do Zoológico Municipal de Bauru, oferecendo uma experiência informativa e interativa.\n\n'
                        'Aqui, os visitantes podem conhecer mais sobre a história do zoológico, aprender sobre os animais e ambientes naturais representados, e se preparar para uma visita inesquecível.\n\n'
                        'O "Zoo Bauru" também busca incentivar o turismo local, a conscientização ambiental e o respeito à vida animal.',
                    fontSize: 20,
                    // Fonte "Chewy" aplicada apenas ao texto
                    textColor: Colors.white,
                    customChild: Text(
                      'O aplicativo "Zoo Bauru" foi desenvolvido com o objetivo de aproximar o público do Zoológico Municipal de Bauru, oferecendo uma experiência informativa e interativa.\n\n'
                          'Aqui, os visitantes podem conhecer mais sobre a história do zoológico, aprender sobre os animais e ambientes naturais representados, e se preparar para uma visita inesquecível.\n\n'
                          'O "Zoo Bauru" também busca incentivar o turismo local, a conscientização ambiental e o respeito à vida animal.\n\n'
                          'Observação: Este aplicativo não contém todos os animais presentes no zoológico, e alguns podem não estar representados em suas localizações exatas. Agradecemos a compreensão!',
                      style: TextStyle(
                        fontFamily: 'Chewy',  // Fonte "Chewy" aplicada no texto
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}