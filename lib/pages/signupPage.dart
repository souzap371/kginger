import 'package:estoque_kginger/controllers/signup.controller.dart';
import 'package:estoque_kginger/data/appstore.dart';
import 'package:estoque_kginger/pages/home_page.dart';
import 'package:estoque_kginger/pages/login_page.dart';
import 'package:estoque_kginger/view-models/signup.viewmodel.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //const SignupPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFf4ece3),
            Color(0xFFf1b7a4),
          ],
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset('images/logo_kginger__removebg_preview.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Nome Completo",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nome inválido.';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      model.name = val!;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email inválido.';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      model.email = val!;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Senha inválida.';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      model.password = val!;
                    },
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFFd1715d),
                          Color(0xFFf1b7a4),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: model.busy
                          ? Center(
                              child: Container(
                                child: CircularProgressIndicator(
                                  backgroundColor: Color(0xFFd1715d),
                                ),
                              ),
                            )
                          : TextButton(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Image.asset('images/login.png'),
                                ],
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                }
                                setState(() {});
                                _controller.create(model).then((data) {
                                  setState(() {});
                                  store.setUser(
                                    data.name,
                                    data.email,
                                    data.picture,
                                    data.token,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                });
                              },
                            ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(top: 10),
                  //   child: SizedBox(
                  //     height: 40,
                  //     width: 40,
                  //     child: TextButton(
                  //       child: Center(
                  //         child: Text(
                  //           'Voltar',
                  //           style: TextStyle(
                  //             color: Color(0xFFd1715d),
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => LoginPage(),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
