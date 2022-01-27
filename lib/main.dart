import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

enum TaxRate { tax22, tax10, tax4 }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class TaxRateButton extends StatelessWidget {
  String label;
  bool active;
  Function()? onPressed;

  TaxRateButton(this.label, this.active, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
      style: active ? TextButton.styleFrom(backgroundColor: Colors.blueAccent) : TextButton.styleFrom(backgroundColor: null),
    );
  }
}

class MyAppState extends State<MyApp> {
  var selectedTax = TaxRate.tax22;
  var taxValue = 0.0;

  void changeValue(String value) {
    setState(() {
      taxValue = double.parse(value);
    });
  }

  void onChangeTaxRate(TaxRate taxRate){
    setState(() {
      selectedTax = taxRate;
    });
  }

  bool isSelected(TaxRate taxRate){
    return taxRate == selectedTax;
  }

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
                      TextField(
                        onChanged: changeValue,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Inserisci importo'),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: TaxRateButton("22.0%",isSelected(TaxRate.tax22), (){
                              onChangeTaxRate(TaxRate.tax22);
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: TaxRateButton("10.0%",isSelected(TaxRate.tax10), (){
                              onChangeTaxRate(TaxRate.tax10);
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: TaxRateButton("4.0%", isSelected(TaxRate.tax4), (){
                              onChangeTaxRate(TaxRate.tax4);
                            }),
                          ),
                        ],
                      ),
                      Text('Importo senza IVA: ${taxValue.toString()}'),
                      Text('Importo senza IVA: ${taxValue.toString()}'),
                      Text('Importo senza IVA: ${taxValue.toString()}'),
                    ],
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text('Calcola IVA',
                          style: TextStyle(color: Colors.white)),
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
