import 'package:flutter/material.dart';

Widget defaultButtonWidget(Function()? onPressed, String buttonText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: SizedBox(
      height: 40,
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 70, 96, 243),
        ),
        child: Text(buttonText),
      ),
    ),
  );
}
