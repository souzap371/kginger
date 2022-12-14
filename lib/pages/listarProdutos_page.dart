import 'package:estoque_kginger/pages/filtrarProdutos.dart';
import 'package:estoque_kginger/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({super.key});

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  _criarLinhaTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.all(8),
        );
      }).toList(),
    );
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
      body: Container(
        color: Color(0xFFf4ece3),
        padding: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            const Text(
              'Listar Produtos',
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
            Container(
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(70),
                border: const TableBorder(
                  horizontalInside: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  verticalInside: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
                children: [
                  _criarLinhaTable(
                    "ID, NOME, QTD, P M G, PREÇO",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
