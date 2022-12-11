import 'package:estoque_kginger/pages/cadastrarProdutos.dart';
import 'package:estoque_kginger/pages/home_page.dart';
import 'package:estoque_kginger/pages/listarProdutos_page.dart';
import 'package:estoque_kginger/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K-Ginger',
      debugShowCheckedModeBanner: false,
      home: ListarProdutos(),
    );
  }
}
