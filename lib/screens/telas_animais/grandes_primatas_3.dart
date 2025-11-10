import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';


class GrandesPrimatasScreen3 extends StatefulWidget {
  const GrandesPrimatasScreen3({super.key});

  @override
  State<GrandesPrimatasScreen3> createState() => _GrandesPrimatasScreenState();
}

class _GrandesPrimatasScreenState extends State<GrandesPrimatasScreen3> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.stop();
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
            'Grandes Primatas Brasileiros',
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
                  'assets/animals_images/mico_leao_cara_dourada.png',                              // IMAGEM DO ANIMAL
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'MICO-LEÃO DE CARA DOURADA',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Bangers',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF065F0D),
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'O Mico-Leão de Cara Dourada, é um dos micos-leões mais coloridos e ameaçados da Mata Atlântica!',
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
                    'Espécie: Leontopithecus Chrysomelas.',
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
                    'Status de conservação: Em Perigo.',
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
                    'Tamanho: Entre 20cm a 34cm (Corpo).',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Chewy',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await _player.play(AssetSource('sounds/som_mico_leao_cara_dourada.mp3'));                     // CAMINHO DO SOM DO ANIMAL
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
                      final url = Uri.parse('https://pt.wikipedia.org/wiki/Mico-le%C3%A3o-de-cara-dourada');
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}