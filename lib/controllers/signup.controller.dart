import 'package:estoque_kginger/models/userModel.dart';
import 'package:estoque_kginger/repositories/account.repository.dart';
import 'package:estoque_kginger/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository? repository;

  SignupController() {
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository!.createAccount(model);
    model.busy = false;
    return user;
  }
}
