import 'package:flutter/material.dart';
import 'package:xlo_clone_mobx/screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => LoginScreen())
        );
      },
      child: Container(
        color: Colors.purple,
        height: 95.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.white, size: 35.0,),
            SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Acesse a sua conta agora!', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  Text('Clique aqui', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
