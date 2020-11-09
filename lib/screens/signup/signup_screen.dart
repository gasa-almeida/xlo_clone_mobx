import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone_mobx/components/error_box.dart';
import 'package:xlo_clone_mobx/screens/signup/components.dart';
import 'package:xlo_clone_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = new SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                margin: const EdgeInsets.symmetric(horizontal: 32.0),
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Observer(
                        builder: (_) {
                          return ErrorBox(
                            message: signupStore.error,
                          );
                        },
                      ),
                      FieldTitle(
                        title: 'Apelido',
                        subtitle: 'Como aparecerá em seus anuncios',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: João da Silva',
                              isDense: true,
                              errorText: signupStore.nameError,
                            ),
                            onChanged: signupStore.setName,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'E-mail',
                        subtitle: 'Enviaremos um e-mail de confirmação',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: joao@email.com',
                              isDense: true,
                              errorText: signupStore.emailError,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            onChanged: signupStore.setEmail,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'Celular',
                        subtitle: 'Proteja sua conta',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Exemplo: (00) 00000-0000',
                              isDense: true,
                              errorText: signupStore.phoneError,
                            ),
                            onChanged: signupStore.setPhone,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'Senha',
                        subtitle: 'Use letras, números e caracteres especiais',
                      ),
                      Observer(
                        builder: (_) {
                          return TextField(
                            enabled: !signupStore.loading,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                isDense: true,
                                errorText: signupStore.pass1Error),
                            onChanged: signupStore.setPass1,
                            obscureText: true,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FieldTitle(
                        title: 'Confirmar senha',
                        subtitle: 'Repita a senha',
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signupStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.pass2Error,
                          ),
                          obscureText: true,
                          onChanged: signupStore.setPass2,
                        );
                      }),
                      Observer(
                        builder: (_) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 12.0),
                            height: 40.0,
                            child: RaisedButton(
                              color: Colors.orange,
                              disabledColor: Colors.orange.withAlpha(120),
                              child: signupStore.loading
                                  ? CircularProgressIndicator()
                                  : Text('Cadastrar'),
                              textColor: Colors.white,
                              elevation: 0,
                              onPressed: signupStore.signUpPressed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Já tem uma conta? ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Entrar ',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
