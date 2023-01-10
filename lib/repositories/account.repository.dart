import 'package:estoque_kginger/models/userModel.dart';
import 'package:estoque_kginger/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(new Duration(milliseconds: 1500));
    return new UserModel(
      id: "1",
      name: "Palbo Souza",
      email: "souzap371@gmail.com",
      picture: "https://picsum.photos/200/300",
      token: "xpto",
    );
  }
}
