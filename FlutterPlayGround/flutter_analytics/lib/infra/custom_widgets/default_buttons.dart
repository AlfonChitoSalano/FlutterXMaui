import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

Widget mainButtons(String buttonText, {Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryColor,
        ),
        child: Text(buttonText),
      ),
    ),
  );
}
