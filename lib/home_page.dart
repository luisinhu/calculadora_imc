import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controlea = TextEditingController();
  final controleb = TextEditingController();
  int casas = 2;
  dynamic resultado;
  String classificacao = '';

  _calcular() {
    String text1 = controlea.text;
    String text2 = controleb.text;

    double? peso = double.tryParse(text1);
    double? altura = double.tryParse(text2);

    if (peso != null && altura != null && altura > 0) {
      setState(() {
        resultado = peso / pow(altura, 2);
        resultado;
      });
    }
    if (resultado < 16.9) {
      classificacao = 'Muito abaixo do peso';
    } else if (resultado >= 17 && resultado <= 18.4) {
      classificacao = 'Abaixo do Peso';
    } else if (resultado >= 18.5 && resultado <= 24.9) {
      classificacao = 'Peso Normal';
    } else if (resultado >= 25 && resultado <= 29.9) {
      classificacao = 'Acima do Peso';
    } else if (resultado >= 30 && resultado <= 34.9) {
      classificacao = 'Obesidade Grau I';
    } else if (resultado >= 35 && resultado <= 40) {
      classificacao = 'Obesidade Grau II';
    } else if (resultado > 40) {
      classificacao = 'Obesidade Grau III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/imc_image.png',
                width: 150, 
                height: 150,
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: controlea,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Peso'),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                   
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Altura'),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                    onPressed: _calcular, child: const Text('Calcule')),
              ),
            ),
            const SizedBox(height: 25),
            Text(
                'IMC: ${resultado != null ? resultado.toStringAsFixed(casas) : ''}'),
            Text('Classificação:  $classificacao')
          ],
        ),
      ),
    );
  }
}
