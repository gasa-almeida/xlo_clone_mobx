import 'package:mobx/mobx.dart';
import 'package:xlo_clone_mobx/helpers/extensions.dart';
import 'package:xlo_clone_mobx/models/user.dart';
import 'package:xlo_clone_mobx/repositories/user_repositoriy.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  //observables são as variáveis/objetos observaveis que representam e sofrem alterações
  //actions são as funções que realizam alterações nos observáveis
  //computeds reune os dados que derivam dos observáveis para realizar um validação por exemplo

  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Telefone inválido';
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length > 4;
  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else if (pass2.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid =>
      nameValid && phoneValid && emailValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = User(name: name, email: email, phone: phone, password: pass1);

    try {
      await UserRepository().signUp(user);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
