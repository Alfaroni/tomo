import 'package:flutter/material.dart';

class ColorsPalette {
  static const yellow = Color(0xffFFE604);
  static const black = Color(0xff1E1E1E);
}

class Transaction {
  String name;
  String result;
  String status;

  Transaction(this.name, this.result, this.status);
}

class Button extends StatelessWidget {
  final void Function()? onPress;
  final String buttonText;

  const Button({Key? key, required this.buttonText, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(240, 56),
          backgroundColor: ColorsPalette.yellow,
          foregroundColor: ColorsPalette.black, //
          shape: const StadiumBorder(),
          textStyle: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w900)),
      child: Text(buttonText),
    );
  }
}
