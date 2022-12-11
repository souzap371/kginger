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
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Container(
                child: const Text(
                  'Filtrar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
              width: 5,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ID'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('NOME'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('TAMANHO'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('PREÇO'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
              width: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('PESQUISAR'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('DELETAR'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('LIMPAR FILTRO'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFd1715d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
