import 'package:flutter/material.dart';
import 'package:numerical_analisis/screens/result/matrix/MatrixContainer.dart';
import 'package:numerical_analisis/screens/result/matrix/MatrixText.dart';

import 'package:provider/provider.dart';

import '../../../core/Theme/MyTheme.dart';
import '../../../core/prov/MatricesProvider.dart';
import 'MatrixViewWidget.dart';

class MatricesResultScreen extends StatelessWidget {
  static const String routeName = 'matrices result Screen';

  @override
  Widget build(BuildContext context) {
    MatricesProvider provider = Provider.of<MatricesProvider>(context);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(provider.type),
        ),
        body: Consumer<MatricesProvider>(
          builder: (context, value, child) {
            if (value.type == 'Gauss Elimination') {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[0])
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MatrixText(
                          "M21 = a21 / a11 = ${value.matrices[0].rowTwo[0].toStringAsFixed(3)} / ${value.matrices[0].rowOne[0].toStringAsFixed(3)} =  ${value.m21.toStringAsFixed(3)}"),
                      MatrixText(
                          "M31 = a31 / a11 = ${value.matrices[0].rowThree[0].toStringAsFixed(3)} / ${value.matrices[0].rowOne[0].toStringAsFixed(3)} =  ${value.m31.toStringAsFixed(3)}"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[1])
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MatrixText(
                          "M32 = a32 / a22 = ${value.matrices[1].rowTwo[1].toStringAsFixed(3)} / ${value.matrices[1].rowThree[1].toStringAsFixed(3)} =  ${value.m32.toStringAsFixed(3)}")
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[2])
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MatrixText("X1 = ${value.x1.toStringAsFixed(3)}"),
                      MatrixText("X2 = ${value.x2.toStringAsFixed(3)}"),
                      MatrixText("X3 = ${value.x3.toStringAsFixed(3)}"),
                    ],
                  ),
                ],
              );
            } else if (value.type == "Gauss Jordan") {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[0])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[1])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[2])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[3])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[4])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[5])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[6])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[7])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[8])
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/B = ",
                          style: TextStyle(
                              color: MyTheme.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        MatrixViewWidget(value.matrices[9])
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MatrixText("X1 = ${value.x1.toStringAsFixed(3)}"),
                      MatrixText("X2 = ${value.x2.toStringAsFixed(3)}"),
                      MatrixText("X3 = ${value.x3.toStringAsFixed(3)}"),
                    ],
                  ),
                ],
              );
            } else if (value.type == "LU") {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    MatrixText("L * C = B"),
                    Row(
                      children: [
                        MatrixViewWidget(value.matrices[0]),
                        MatrixText("*"),
                        Expanded(
                            child: Column(
                          children: [
                            MatrixContainer("C1"),
                            MatrixContainer("C2"),
                            MatrixContainer("C3"),
                          ],
                        )),
                        MatrixText("="),
                        MatrixViewWidget(value.matrices[1]),
                      ],
                    ),
                    MatrixText("U * X = C"),
                    Row(
                      children: [
                        MatrixViewWidget(value.matrices[2]),
                        MatrixText("*"),
                        Expanded(
                            child: Column(
                          children: [
                            MatrixContainer("X1"),
                            MatrixContainer("X2"),
                            MatrixContainer("X3"),
                          ],
                        )),
                        MatrixText("="),
                        MatrixViewWidget(value.matrices[3]),
                      ],
                    ),
                    MatrixText(
                        "X1 = ${value.x1.toStringAsFixed(3)}    ,    X2 = ${value.x2.toStringAsFixed(3)}    ,    X3 = ${value.x3.toStringAsFixed(3)}"),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          MatrixText("A  =  "),
                          MatrixViewWidget(value.matrices[0]),
                          MatrixText("A  =  ${value.A.toStringAsFixed(3)}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          MatrixText("A1  =  "),
                          MatrixViewWidget(value.matrices[1]),
                          MatrixText("A1  =  ${value.A1.toStringAsFixed(3)}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          MatrixText("A2  =  "),
                          MatrixViewWidget(value.matrices[2]),
                          MatrixText("A2  =  ${value.A2.toStringAsFixed(3)}"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          MatrixText("A3  =  "),
                          MatrixViewWidget(value.matrices[3]),
                          MatrixText("A3  =  ${value.A3.toStringAsFixed(3)}"),
                        ],
                      ),
                    ),
                    MatrixText(
                        "X1 = A1/A = ${value.A1.toStringAsFixed(3)}/${value.A.toStringAsFixed(3)} = ${value.x1.toStringAsFixed(3)}"),
                    MatrixText(
                        "X2 = A2/A = ${value.A2.toStringAsFixed(3)}/${value.A.toStringAsFixed(3)} = ${value.x2.toStringAsFixed(3)}"),
                    MatrixText(
                        "X3 = A3/A = ${value.A3.toStringAsFixed(3)}/${value.A.toStringAsFixed(3)} = ${value.x3.toStringAsFixed(3)}"),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
