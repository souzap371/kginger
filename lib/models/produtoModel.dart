import 'dart:math';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class ProdutoModel {
  final String? id;
  final String? name;
  final int? quantidade;
  final String? tamanho;
  final double? preco;

  ProdutoModel({
    this.id,
    @required this.name,
    @required this.quantidade,
    @required this.tamanho,
    @required this.preco,
  });
}
