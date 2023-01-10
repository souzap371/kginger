import 'package:estoque_kginger/data/appstore.dart';
import 'package:estoque_kginger/models/produtoListaModel.dart';
import 'package:estoque_kginger/models/produtoModel.dart';
import 'package:estoque_kginger/pages/home_page.dart';
import 'package:estoque_kginger/pages/signupPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: MaterialApp(
        title: 'K-Ginger',
        debugShowCheckedModeBanner: false,
        home: SignupPage(),
        // routes: {
        //   AppRoutes.CADASTRAR_PRODUTO: (ctx) => const CadastrarProdutos(),
        // },
      ),
    );
  }
}
