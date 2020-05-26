import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardccionario/Inicio.dart';
import 'package:hardccionario/Componentes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String Hardccionario = 'Diccionario sobre Hardware';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hardccionario',
      home: Inicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void openPage(BuildContext context){
  Navigator .push(context, MaterialPageRoute(
      builder: (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hardccionario'),
      ),
    );
  }));
}
