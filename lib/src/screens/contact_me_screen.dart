import 'package:componentes/src/framework/styles.dart';
import 'package:componentes/src/widgets/circle_image.dart';
import 'package:componentes/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ContactMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleImage(path: 'assets/renato.jpeg'),
            Text('Renato Montufar',
                textAlign: TextAlign.center, style: headline),
            Text('Developer', textAlign: TextAlign.center, style: headline2),
            Divider(indent: 20, endIndent: 20),
            PrimaryButton(icon: Icons.phone, text: '+502 1223 1232'),
            SizedBox(height: 20),
            PrimaryButton(icon: Icons.email, text: 'me@flutterdev.com'),
          ],
        ),
      ),
    );
  }
}
