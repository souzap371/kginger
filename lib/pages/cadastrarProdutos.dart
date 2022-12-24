import 'dart:ffi';

import 'package:estoque_kginger/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final void Function(String, String, int, double) onSubmit;

  @override
  State<CadastrarProdutos> createState() => _CadastrarProdutosState();
}

class _CadastrarProdutosState extends State<CadastrarProdutos> {
  final nomeController = TextEditingController();

  final tamanhoController = TextEditingController();

  final quantidadeController = TextEditingController();

  final precoController = TextEditingController();

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
      body: Container(
        color: Color(0xFFf4ece3),
        padding: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
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
                    TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        labelText: 'Nome Produto',
                      ),
                    ),
                    TextField(
                      controller: tamanhoController,
                      decoration: InputDecoration(
                        labelText: 'Tamanho (P M G)',
                      ),
                    ),
                    TextField(
                      controller: quantidadeController,
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                      ),
                    ),
                    TextField(
                      controller: precoController,
                      decoration: InputDecoration(
                        labelText: 'Valor unitário(R\$)',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            final name = nomeController.text;
                            final tamanho = tamanhoController.text;
                            final quantidade =
                                int.tryParse(quantidadeController.text) ?? 0;
                            final preco =
                                double.tryParse(precoController.text) ?? 0.0;
                            //chamada da funcao onSubmit
                            widget.onSubmit(name, tamanho, quantidade, preco);
                          },
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
            // Container(
            //   height: 600,
            //   decoration: BoxDecoration(
            //     border: Border.all(width: 2.0),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Center(
            //     child: Form(
            //       child: ListView(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(10),
            //             child: TextFormField(
            //               decoration: InputDecoration(
            //                 filled: true,
            //                 border: new OutlineInputBorder(
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(8.0),
            //                   ),
            //                 ),
            //                 labelText: 'NOME DO PRODUTO',
            //                 labelStyle: TextStyle(
            //                   color: Color(0xFFd1715d),
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(10),
            //             child: TextFormField(
            //               decoration: InputDecoration(
            //                 filled: true,
            //                 border: new OutlineInputBorder(
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(8.0),
            //                   ),
            //                 ),
            //                 labelText: 'QUANTIDADE',
            //                 labelStyle: TextStyle(
            //                   color: Color(0xFFd1715d),
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(10),
            //             child: TextFormField(
            //               decoration: InputDecoration(
            //                 filled: true,
            //                 border: new OutlineInputBorder(
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(8.0),
            //                   ),
            //                 ),
            //                 labelText: 'TAMANHO',
            //                 labelStyle: TextStyle(
            //                   color: Color(0xFFd1715d),
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(10),
            //             child: TextFormField(
            //               decoration: InputDecoration(
            //                 filled: true,
            //                 border: new OutlineInputBorder(
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(8.0),
            //                   ),
            //                 ),
            //                 labelText: 'VALOR',
            //                 labelStyle: TextStyle(
            //                   color: Color(0xFFd1715d),
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //),
            // Padding(
            //   padding: const EdgeInsets.only(top: 40),
            //   child: Center(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         ElevatedButton(
            //           onPressed: () {},
            //           child: Text(
            //             'Salvar',
            //             style: TextStyle(
            //               fontSize: 20,
            //             ),
            //           ),
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Color(0xFFd1715d),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
