import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dices',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 100, 100, 1.0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dicee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _diceImages = [
    'assets/dice1.png',
    'assets/dice2.png',
    'assets/dice3.png',
    'assets/dice4.png',
    'assets/dice5.png',
    'assets/dice6.png',
  ]; // lista para sortear a imagem

  String _imagemAtual = 'assets/dice1.png'; // inicia com a dado em 1
  String _imagemAtual2 = 'assets/dice1.png';

  // teremos duas funçoes, 1 para 1° button e 1 para 2° button
  void _sortearDado1() {
    final random =
        Random(); // usa a classe random, que gera um num aleatorio,  para escolher um indice
    setState(() {
      _imagemAtual = _diceImages[random.nextInt(_diceImages.length)];
    });
  }

  void _sortearDado2() {
    final random =
        Random(); // usa a classe random, que gera um num aleatorio,  para escolher um indice
    setState(() {
      _imagemAtual2 = _diceImages[random.nextInt(_diceImages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 100, 100, 1.0),
        centerTitle: true,
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
              child: IconButton(
            icon: Image.asset(
              _imagemAtual,
              width: 140,
              height: 140,
              fit: BoxFit
                  .contain, // para a imagem não exceda os limites e se encaixe na tela
            ),
            onPressed: () {
              _sortearDado1();
            },
          )),
          Center(
              child: IconButton(
            icon: Image.asset(
              _imagemAtual2,
              width: 140,
              height: 140,
              fit: BoxFit
                  .contain, // para a imagem não exceda os limites e se encaixe na tela
            ),
            onPressed: () {
              _sortearDado2();
            },
          )),
        ],
      ),
    );
  }
}
