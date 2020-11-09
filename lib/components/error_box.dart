import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  ErrorBox({this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    } else {
      return Container(
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 40.0,
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Text(
                'Oops! $message. POr favor, tente novamente.',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }
  }
}
