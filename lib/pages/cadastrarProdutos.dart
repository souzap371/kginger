import 'dart:io';

import 'package:estoque_kginger/models/produtoListaModel.dart';
import 'package:estoque_kginger/pages/home_page.dart';
import 'package:estoque_kginger/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/produtoModel.dart';

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({Key? key}) : super(key: key);

  @override
  State<CadastrarProdutos> createState() => _CadastrarProdutosState();
}

class _CadastrarProdutosState extends State<CadastrarProdutos> {
  final _priceFocus = FocusNode();
  final _nomeController = TextEditingController();
  final _tamanhoController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _precoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  bool _isLoading = false;
  File? _pickedImage;

  void _selectImage(File pickImage) {
    setState(() {
      _pickedImage = pickImage;
    });
  }

  @override
  void didChangedDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final product = arg as ProdutoModel;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['quantidade'] = product.quantidade;
        _formData['tamanho'] = product.tamanho;
        _formData['preco'] = product.preco;
      }
    }
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    try {
      await Provider.of<ProdutoListaModel>(
        context,
        listen: false,
      ).saveProduct(_formData);

      Navigator.of(context).pop();
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ocorreu um erro!'),
          content: const Text('Ocorreu um erro ao salvar o produto.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        backgroundColor: Color(0xFFd1715d),
        title: Image.asset(
          'images/logo_kginger.png',
          height: 90,
          width: 90,
          alignment: Alignment.center,
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Color(0xFFf4ece3),
              padding: EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      'Cadastrar Produtos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFd1715d),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: _formData['name']?.toString(),
                              // controller: _nomeController,
                              decoration: InputDecoration(
                                labelText: 'Nome Produto',
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_priceFocus);
                              },
                              onSaved: (name) => _formData['name'] = name ?? '',
                              validator: (_name) {
                                final name = _name ?? '';
                                if (name.trim().isEmpty) {
                                  return 'Nome é obrigatório';
                                }
                                if (name.trim().length < 3) {
                                  return 'Nome precisa no mínimo de 3 letras.';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              initialValue: _formData['tamanho']?.toString(),
                              // controller: _nomeController,
                              decoration: InputDecoration(
                                labelText: 'Tamanho do Produto',
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_priceFocus);
                              },
                              onSaved: (tamanho) =>
                                  _formData['tamanho'] = tamanho ?? '',
                              validator: (_tamanho) {
                                final tamanho = _tamanho ?? '';
                                if (tamanho.trim().isEmpty) {
                                  return 'Tamanho é obrigatório';
                                }
                                if (tamanho.trim().length == null) {
                                  return 'Tamanho precisa no mínimo de 1 letra.';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              initialValue: _formData['quantidade']?.toString(),
                              // controller: _nomeController,
                              decoration: InputDecoration(
                                labelText: 'Quantidade',
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_priceFocus);
                              },
                              onSaved: (quantidade) =>
                                  _formData['quantidade'] = quantidade ?? '',
                              validator: (_quantidade) {
                                final quantidade = _quantidade ?? '';
                                if (quantidade.trim().isEmpty) {
                                  return 'Quantidade é obrigatória';
                                }
                                if (quantidade.trim().length == 0) {
                                  return 'Quantidade deve ser informada.';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              initialValue: _formData['preco']?.toString(),
                              // controller: _nomeController,
                              decoration: InputDecoration(
                                labelText: 'Preço',
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_priceFocus);
                              },
                              onSaved: (preco) =>
                                  _formData['preco'] = preco ?? '',
                              validator: (_preco) {
                                final preco = _preco ?? '';
                                if (preco.trim().isEmpty) {
                                  return 'Preço é obrigatória';
                                }
                                if (preco.trim().length == 0) {
                                  return 'Preço deve ser informado.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            ImageInput(this._selectImage),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: _submitForm,
                                  child: Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                      color: Color(0xFFd1715d),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
