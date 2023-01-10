import 'dart:convert';
import 'dart:math';
import 'package:estoque_kginger/exceptions/http_exception.dart';
import 'package:estoque_kginger/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:estoque_kginger/models/produtoModel.dart';
import 'package:flutter/material.dart';

class ProdutoListaModel with ChangeNotifier {
  final String _token;
  final String _userId;
  List<ProdutoModel> _items = [];
  List<ProdutoModel> get items => [...items];

  ProdutoListaModel([
    this._token = '',
    this._userId = '',
    this._items = const [],
  ]);

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    _items.clear();

    final response = await http.get(
      Uri.parse(
        '${Constants.PRODUCT_BASE_URL}/${_items}.json?auth=$_token',
      ),
    );
    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((productId, productData) {
      _items.add(
        ProdutoModel(
          id: productId,
          name: productData['name'],
          quantidade: productData['quantidade'],
          tamanho: productData['tamanho'],
          preco: productData['preco'],
        ),
      );
    });
    // _items.clear();
    notifyListeners();
  }

  Future<void> saveProduct(Map<String, Object> data) async {
    bool hasId = data['id'] != null;

    final product = ProdutoModel(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      quantidade: data['quantidade'] as int,
      tamanho: data['tamanho'] as String,
      preco: data['preco'] as double,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> addProduct(ProdutoModel product) async {
    final response = await http.post(
      Uri.parse(
        '${Constants.PRODUCT_BASE_URL}/${_userId}.json?auth=$_token',
      ),
      body: jsonEncode(
        {
          "name": product.name,
          "quantidade": product.quantidade,
          "tamanho": product.tamanho,
          "preco": product.preco,
        },
      ),
    );
    final id = jsonDecode(response.body)['name'];
    _items.add(
      ProdutoModel(
        id: id,
        name: product.name,
        quantidade: product.quantidade,
        tamanho: product.tamanho,
        preco: product.preco,
      ),
    );
    notifyListeners();
  }

  Future<void> updateProduct(ProdutoModel product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      await http.patch(
        Uri.parse(
          '${Constants.PRODUCT_BASE_URL}/${product.id}.json?auth=$_token',
        ),
        body: jsonEncode(
          {
            "name": product.name,
            "quantidade": product.quantidade,
            "tamanho": product.tamanho,
            "preco": product.preco,
          },
        ),
      );
      _items[index] = product;
      notifyListeners();
    }
  }

  Future<void> removeProduct(ProdutoModel product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      final product = _items[index];
      _items.remove(product);
      notifyListeners();

      final response = await http.delete(
        Uri.parse(
          '${Constants.PRODUCT_BASE_URL}/${product.id}.json?auth=$_token',
        ),
      );
      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException(
          msg: 'Não foi possível excluir o produto.',
          statusCode: response.statusCode,
        );
      }
    }
  }
}
