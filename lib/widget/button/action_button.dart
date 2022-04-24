import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isBusy;
  final bool isEnabled;
  const ActionButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isBusy = false,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isBusy ? () {} : onPressed,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 25, 125, 218),
              borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          child: isBusy
              ? SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )),
    );
  }
}
