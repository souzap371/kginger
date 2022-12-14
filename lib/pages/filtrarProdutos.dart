import 'package:estoque_kginger/pages/listarProdutos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FiltrarProdutos extends StatefulWidget {
  const FiltrarProdutos({super.key});

  @override
  State<FiltrarProdutos> createState() => _FiltrarProdutosState();
}

class _FiltrarProdutosState extends State<FiltrarProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd1715d),
        title: Image.asset(
          'images/logo_kginger.png',
          height: 90,
          width: 90,
          alignment: Alignment.center,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListarProdutos(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Color(0xFFf4ece3),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: [
                Text(
                  'Filtro de Produtos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFFd1715d),
                      labelText: 'Nome do Produto',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFFd1715d),
                      labelText: 'Tamanho do Produto',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Color(0xFFd1715d),
                      labelText: 'Preço do Produto',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
