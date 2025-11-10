import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';


class GralhaScreen extends StatefulWidget {
  const GralhaScreen({super.key});

  @override
  State<GralhaScreen> createState() => _GralhaScreenState();
}

class _GralhaScreenState extends State<GralhaScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.stop(); // Para o som ao sair da tela
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: const Color(0xFFB6E388),
        appBar: AppBar(
          backgroundColor: const Color(0xFFB6E388),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Pequenas Aves',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Chewy',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/animals_images/Gralha.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Gralha',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Bangers',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF065F0D),
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Gralha, a inteligente "rainha das florestas brasileiras", conhecida por sua astúcia e memória afiada! Esconde alimentos (lembra de 90% deles). '
                    'Reconhece humanos individualmente.',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Chewy',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Icon(Icons.pets),
                  SizedBox(width: 8),
                  Text(
                    'Espécie: Cyanocorax Yucatanicus.',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Chewy',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.warning_amber_rounded),
                  SizedBox(width: 8),
                  Text(
                    'Status de conservação: Quase Ameaçada.',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Chewy',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.straighten),
                  SizedBox(width: 8),
                  Text(
                    'Entre 30cm e 40cm (Corpo).',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Chewy',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Mais espaço antes dos botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await _player.play(AssetSource('sounds/som_gralha.mp3')); // Caminho correto
                    },
                    icon: const Icon(Icons.volume_up),
                    label: const Text('OUVIR SOM'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Bangers',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse('https://pt.wikipedia.org/wiki/Gralha#:~:text=Gralha%20é%20um%20nome%20comum,o%20nome%20comum%20de%20gralhas.');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Não foi possível abrir a URL.';
                      }
                    },
                    child: const Text('VER MAIS'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Bangers',
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espaço extra no final
            ],
          ),
        ),
      ),
    );
  }
}