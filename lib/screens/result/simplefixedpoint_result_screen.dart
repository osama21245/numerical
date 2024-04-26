import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:numerical_analisis/core/Theme/app_pallete.dart';

class SimpleFixedPointResultScreen extends StatefulWidget {
  const SimpleFixedPointResultScreen({super.key});

  @override
  State<SimpleFixedPointResultScreen> createState() =>
      _SimpleFixedPointResultScreenState();
}

class _SimpleFixedPointResultScreenState
    extends State<SimpleFixedPointResultScreen> {
  @override
  Widget build(BuildContext context) {
    final operationsSimpleFixedPoint = BlocProvider.of<OperationsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Table Example'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(color: AppPallete.greyColor),
              columnWidths: {
                0: FixedColumnWidth(100), // width of the first column
                1: FlexColumnWidth(), // width of the second column
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Text("xi")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Text("fxi")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Text("erorr")),
                    ),
                  ],
                ),
                ...(operationsSimpleFixedPoint.state
                        as OperationsSimpleFixedPointSuccess)
                    .simpleFixedPointModel
                    .map((e) => TableRow(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child:
                            //       TableCell(child: Text(e.index.toString())),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TableCell(child: Text(e.xi.toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  TableCell(child: Text(e.xiPlus1.toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TableCell(
                                  child: Text(e.erorr == 0.0
                                      ? ""
                                      : e.erorr.toString())),
                            ),
                          ],
                        ))
                    .toList()
                // Generate TableRow widgets dynamically from the dataList
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "result=${(operationsSimpleFixedPoint.state as OperationsSimpleFixedPointSuccess).simpleFixedPointModel[(operationsSimpleFixedPoint.state as OperationsSimpleFixedPointSuccess).simpleFixedPointModel.length - 1].xi}"),
            ],
          )
        ],
      ),
    );
  }
}
