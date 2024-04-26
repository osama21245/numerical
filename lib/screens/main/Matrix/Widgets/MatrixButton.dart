import 'package:flutter/material.dart';

class MatrixButton extends StatelessWidget {
  String image;
  final void Function() onButtonPress;
  MatrixButton(this.image, this.onButtonPress);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPress,
      child: Center(
          child: Image.asset(
        image,
        height: 500,
      )),
    );
  }
}
