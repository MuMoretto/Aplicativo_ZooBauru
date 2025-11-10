import 'package:flutter/material.dart';
import '../background_widget.dart';
import 'package:zoobaurumap/screens/custom_back_button.dart';
import 'package:zoobaurumap/screens/text_box.dart';

class TelaHistoria extends StatelessWidget {
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
              top: 80,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 600,
                      maxHeight: MediaQuery.of(context).size.height * 0.60,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextBox(
                      title: 'História do Zoológico',
                      customChild: SingleChildScrollView(
                        child: Text(
                          'Com as obras de construção iniciadas em 1977, o Parque Zoológico de Bauru foi inaugurado em 24 de agosto de 1980, contando com um pequeno número de animais, a maioria deles proveniente do zoológico da cidade de Bastos, que acabava de ser desativado.\n\n Localizado em uma área total de 20 hectares, o Zoo Bauru faz limite com o Jardim Botânico Municipal, o qual conserva 280 hectares de cerrado, representando uma das maiores reservas deste bioma no estado de São Paulo.\n\n  Por estar inserido em área de vegetação preservada, o Zoo Bauru abriga diversas espécies da fauna nativa regional, como o tucano-toco, quati, jacupemba, calango-verde, teiú, entre outras que vivem livremente no local.\n\n Além dos cuidados com os animais do plantel, o Zoológico de Bauru auxilia os animais da natureza que chegam por meio da Polícia Ambiental e do Corpo de Bombeiros. Vítimas das ações humanas no ambiente, como os atropelamentos, queimadas e tráfico, estes animais passam por tratamento veterinário e sempre que se tornam aptos retornam ao ambiente natural.',
                          style: TextStyle(
                            fontFamily: 'Chewy',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}