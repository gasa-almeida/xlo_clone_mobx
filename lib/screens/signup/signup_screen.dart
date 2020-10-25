import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_clone_mobx/screens/signup/components.dart';

class SignUpScreen extends StatelessWidget {
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
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              elevation: 8.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(title: 'Apelido', subtitle: 'Como aparecerá em seus anuncios',),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: João da Silva',
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    FieldTitle(title: 'E-mail', subtitle: 'Enviaremos um e-mail de confirmação',),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: joao@email.com',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                    ),
                    const SizedBox(height: 16.0,),
                    FieldTitle(title: 'Celular', subtitle: 'Proteja sua conta',),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exemplo: (00) 00000-0000',
                        isDense: true,
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                    ),
                    const SizedBox(height: 16.0,),
                    FieldTitle(title: 'Senha', subtitle: 'Use letras, números e caracteres especiais',),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0,),
                    FieldTitle(title: 'Confirmar senha', subtitle: 'Repita a senha',),
                    TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      obscureText: true,
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12.0),
                      height: 40.0,
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Text('Entrar'),
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text('Já tem uma conta? ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          GestureDetector(
                            onTap: (){
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
    );
  }
}
