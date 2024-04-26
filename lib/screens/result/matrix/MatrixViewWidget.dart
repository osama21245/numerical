import 'package:flutter/material.dart';
import 'package:numerical_analisis/screens/result/matrix/MatrixContainer.dart';

import '../../../models/Matrix.dart';

class MatrixViewWidget extends StatelessWidget {
  Matrix matrix;
  MatrixViewWidget(this.matrix);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: matrix.rowOne
                .map((e) => MatrixContainer(e.toString()))
                .toList()),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: matrix.rowTwo
                .map((e) => MatrixContainer(e.toString()))
                .toList()),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: matrix.rowThree
                .map((e) => MatrixContainer(e.toString()))
                .toList()),
      ],
    ));
  }
}
