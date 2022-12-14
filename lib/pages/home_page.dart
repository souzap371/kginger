import 'package:estoque_kginger/data/appstore.dart';
import 'package:estoque_kginger/pages/cadastrarProdutos.dart';
import 'package:estoque_kginger/pages/listarProdutos_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
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
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFd1715d),
              ),
              accountName: Text(store.name),
              accountEmail: Text(store.email),
              currentAccountPicture: CircleAvatar(
                child: Image.network(store.picture),
                backgroundColor: Color(0xFFd1715d),
              ),
            ),
            ListTile(
              title: Text(
                'Perfil',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Perfil do Usuário'),
              leading: Image.asset(
                'images/perfil.png',
                height: 40,
                width: 40,
              ),
              trailing: Icon(Icons.arrow_forward),
              autofocus: true,
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Listar Produtos',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Produtos Cadastrados'),
              leading: Image.asset(
                'images/roupas_editada.png',
                height: 40,
                width: 40,
              ),
              trailing: Icon(Icons.arrow_forward),
              autofocus: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListarProdutos(
                      produtos: [],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Cadastrar Produtos',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Novo Produto'),
              leading: Image.asset(
                'images/adicionar-ficheiro_editada.png',
                height: 40,
                width: 40,
              ),
              trailing: Icon(Icons.arrow_forward),
              autofocus: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastrarProdutos(),
                    ));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 310),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.exit_to_app),
                color: Color(0xFFd1715d),
                iconSize: 40,
                alignment: Alignment.bottomLeft,
              ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListarProdutos(
                          produtos: [],
                        ),
                      ),
                    );
                  },
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CadastrarProdutos(),
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
