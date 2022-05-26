import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon/neon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final n2 = TextEditingController();
  final n1 = TextEditingController();
  int suma = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text('Sistemas Distribuidos'),
          elevation: 0),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tituloNeon('Suma'),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                  controller: n1,
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Ingrese el primer numero',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(10.0)),
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                  controller: n2,
                  cursorColor: Colors.teal,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Ingrese el segundo numero',
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(10.0)),
                  ))),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal[400])),
              child:
                  const Text('Calcular', style: TextStyle(color: Colors.white)),
              onPressed: () {
                if (n1.text.isNotEmpty && n2.text.isNotEmpty) {
                  suma = int.parse(n1.text) + int.parse(n2.text);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Resultado de la suma',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.teal)),
                            content: Text(suma.toString()),
                            actions: [
                              CupertinoDialogAction(
                                  child: const Text('Aceptar',
                                      style: TextStyle(color: Colors.teal)),
                                  onPressed: () {
                                    n1.clear();
                                    n2.clear();
                                    Navigator.of(context).pop();
                                  })
                            ],
                          ));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('Alerta!',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.teal)),
                            content: const Text(
                                'Ingrese los numeros que quiere sumar'),
                            actions: [
                              CupertinoDialogAction(
                                  child: const Text('Aceptar',
                                      style: TextStyle(color: Colors.teal)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ],
                          ));
                  setState(() {});
                }
              })
        ],
      )),
    );
  }

  Widget tituloNeon(String titulo) {
    return Neon(
      text: titulo,
      color: Colors.teal,
      fontSize: 50,
      font: NeonFont.Membra,
      flickeringText: true,
      flickeringLetters: const [0, 1],
    );
  }
}
