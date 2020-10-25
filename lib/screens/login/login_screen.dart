import 'package:flutter/material.dart';
import 'package:xlo_clone_mobx/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
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
                  Text("Acessar com e-mail:", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, color: Colors.grey[900]),),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 4.0, top: 8.0,),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 3.0, bottom: 4.0, top: 8.0,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Esqueceu sua senha? ',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                            ),
                          ),
                          onTap: (){},
                        ),
                      ],
                    ),
                  ),
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
                  Divider( color: Colors.grey,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text('Não tem uma conta? ',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        GestureDetector(
                          onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                          },
                          child: Text(
                            'Cadastre-se ',
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
    );
  }
}
