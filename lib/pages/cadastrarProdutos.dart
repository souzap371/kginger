import 'package:estoque_kginger/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastrarProdutos extends StatelessWidget {
  const CadastrarProdutos({super.key});

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
            Container(
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'ID',
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
