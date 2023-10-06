import 'package:flutter/material.dart';

class ShowSnackBar {
  ShowSnackBar({required this.context});
  final BuildContext context;
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars(); //to clear prev snack bars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: MediaQuery.of(context).size.width * 0.33,
        ),
        content: Wrap(
          children: [
            Center(
              child: Text(
                message,
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      ),
    );
  }
}
