import 'package:estoque_kginger/data/dummyData.dart';
import 'package:estoque_kginger/models/produtoModel.dart';
import 'package:estoque_kginger/pages/filtrarProdutos.dart';
import 'package:estoque_kginger/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListarProdutos extends StatelessWidget {
  const ListarProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    final _produtos = [
      ProdutoModel(
        id: 't1',
        name: 'Calça Feminina',
        quantidade: 15,
        tamanho: 'M',
        preco: 75.90,
      ),
      ProdutoModel(
        id: 't2',
        name: 'Calça Masculina',
        quantidade: 12,
        tamanho: 'G',
        preco: 170.80,
      ),
    ];

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FiltrarProdutos(),
                ),
              );
            },
            icon: Icon(Icons.filter_alt_sharp),
          ),
        ],
        backgroundColor: Color(0xFFd1715d),
        title: Image.asset(
          'images/logo_kginger.png',
          height: 90,
          width: 90,
          alignment: Alignment.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            child: Card(
              color: Color(0xFFd1715d),
              child: Text(
                'Lista de Produtos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              elevation: 5,
            ),
          ),
          Column(
            children: _produtos.map((pr) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        pr.id.toString(),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pr.name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'R\$ ${pr.preco!.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
      //body:ListView.builder(
      //itemBuilder: null,
      //itemCount: ,

      // Container(
      //   color: Color(0xFFf4ece3),
      //   padding: EdgeInsets.only(top: 30),
      //   alignment: Alignment.topCenter,
      //   child: ListView(
      //     children: [
      //       const Text(
      //         'Listar Produtos',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           fontSize: 20,
      //           color: Color(0xFFd1715d),
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //         width: 10,
      //       ),
      // Container(
      //   height: 600,
      //   decoration: BoxDecoration(
      //     border: Border.all(width: 2.0),
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: Table(
      //     defaultColumnWidth: FixedColumnWidth(70),
      //     border: const TableBorder(
      //       horizontalInside: BorderSide(
      //         color: Colors.black,
      //         style: BorderStyle.solid,
      //         width: 1,
      //       ),
      //       verticalInside: BorderSide(
      //         color: Colors.black,
      //         style: BorderStyle.solid,
      //         width: 1,
      //       ),
      //     ),
      //     children: [
      //       _criarLinhaTable(
      //         "ID, NOME, QTD, P M G, PREÇO",
      //       ),
      //     ],
      //   ),
      // ),

      // ),
    );
  }
}
