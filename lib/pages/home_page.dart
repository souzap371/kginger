import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'images/logo_kginger.png',
          height: 90,
          width: 90,
          alignment: FractionalOffset.center,
        ),
        backgroundColor: Color(0xFFd1715d),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        //   color: Color(0xFFd1715d),
        // ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFd1715d),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: ListView(
          padding: EdgeInsets.all(50),
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                child: TextButton(
                  autofocus: true,
                  child: Column(
                    children: [
                      Text(
                        'Listar Produtos',
                        style: TextStyle(
                          color: Color(0xFFd1715d),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          child: Image.asset('images/roupas_editada.png'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 60),
              child: SizedBox(
                child: TextButton(
                  autofocus: true,
                  child: Column(
                    children: [
                      Text(
                        'Cadastrar Produtos',
                        style: TextStyle(
                          color: Color(0xFFd1715d),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                          child: Image.asset(
                              'images/adicionar-ficheiro_editada.png'),
                          height: 90,
                          width: 90,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: IconButton(
                      autofocus: true,
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Color(0xFFd1715d),
                      ),
                      onPressed: () {},
                    ),
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
