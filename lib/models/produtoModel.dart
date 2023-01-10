import 'package:flutter/material.dart';

class ProdutoModel with ChangeNotifier {
  final String id;
  final String name;
  final int quantidade;
  final String tamanho;
  final double preco;

  ProdutoModel({
    required this.id,
    required this.name,
    required this.quantidade,
    required this.tamanho,
    required this.preco,
  });
}
