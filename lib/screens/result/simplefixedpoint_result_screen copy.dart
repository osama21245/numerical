import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:numerical_analisis/core/Theme/app_pallete.dart';

class NewtonResultScreen extends StatefulWidget {
  const NewtonResultScreen({super.key});

  @override
  State<NewtonResultScreen> createState() => _NewtonResultScreenState();
}

class _NewtonResultScreenState extends State<NewtonResultScreen> {
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
                      child: TableCell(child: Text("index")),
                    ),
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
                      child: TableCell(child: Text("fxidash")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TableCell(child: Text("erorr")),
                    ),
                  ],
                ),
                ...(operationsSimpleFixedPoint.state as OperationsNewtonSuccess)
                    .newtonModel
                    .map((e) => TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TableCell(child: Text(e.index.toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TableCell(child: Text(e.xi.toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TableCell(child: Text(e.fxi.toString())),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  TableCell(child: Text(e.fxidash.toString())),
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
                  "result=${(operationsSimpleFixedPoint.state as OperationsNewtonSuccess).newtonModel[(operationsSimpleFixedPoint.state as OperationsNewtonSuccess).newtonModel.length - 1].xi}"),
            ],
          )
        ],
      ),
    );
  }
}
