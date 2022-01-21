import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Welcome to Flutter",
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Taxes Calculator'),
            ),
            body: Container(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Inserisci importo'),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ElevatedButton(onPressed: () {}, child: const Text('22.0%')),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: ElevatedButton(onPressed: null, child: Text('10.0%')),
                          ),
                          const ElevatedButton(onPressed: null, child: Text('4.0%'))
                        ],
                      ),
                      const Text('Importo senza IVA'),
                      const Text('Importo senza IVA'),
                      const Text('Importo senza IVA')
                    ],
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton.icon(
                      onPressed: () {
                      },
                      label: const Text('Calcola IVA', style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              padding: const EdgeInsets.all(20),
            )));
  }
}
