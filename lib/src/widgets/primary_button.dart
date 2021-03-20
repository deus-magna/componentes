import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const PrimaryButton({Key key, this.icon, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildButton(icon, text);
  }

  ElevatedButton _buildButton(IconData icon, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(), primary: Colors.white),
      onPressed: () => print('me'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.black))
          ],
        ),
      ),
    );
  }
}
