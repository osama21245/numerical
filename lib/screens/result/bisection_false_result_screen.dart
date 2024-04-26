import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:numerical_analisis/core/Theme/app_pallete.dart';

class BisectionAndFalseResultScreen extends StatefulWidget {
  const BisectionAndFalseResultScreen({super.key});

  @override
  State<BisectionAndFalseResultScreen> createState() =>
      _BisectionAndFalseResultScreenState();
}

class _BisectionAndFalseResultScreenState
    extends State<BisectionAndFalseResultScreen> {
  int iteration = 0;
  @override
  Widget build(BuildContext context) {
    final operationsBisection = BlocProvider.of<OperationsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Table Example'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(color: AppPallete.greyColor),
              columnWidths: {
                0: const FixedColumnWidth(100), // width of the first column
                1: const FlexColumnWidth(), // width of the second column
              },
              children: [
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("index")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("xl")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("fxl")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("xu")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("fxu")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("xr")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("fxr")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("erorr")),
                    ),
                  ],
                ),

                ...List.generate(
                    (operationsBisection.state
                            as OperationsBisectionAndFalsePositionSuccess)
                        .bisectionModal
                        .length, (index) {
                  final value = (operationsBisection.state
                          as OperationsBisectionAndFalsePositionSuccess)
                      .bisectionModal[index];
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(index.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.xl.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.fxl.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.xu.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.fxu.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.listxr.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.fxr.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(
                            child: Text(value.listerorr == 0.0
                                ? ""
                                : value.listerorr.toString())),
                      ),
                    ],
                  );
                })
                // ...(operationsBisection.state
                //         as OperationsBisectionAndFalsePositionSuccess)
                //     .bisectionModal
                //     .map((e) => )
                //     .toList()
                // Generate TableRow widgets dynamically from the dataList
                // TableRow(
                //           children: [
                //             // Padding(
                //             //   padding: const EdgeInsets.all(8.0),
                //             //   child:
                //             //       TableCell(child: Text(e.index.toString())),
                //             // ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: TableCell(child: Text(e.xl.toString())),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: TableCell(child: Text(e.fxl.toString())),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: TableCell(child: Text(e.xu.toString())),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: TableCell(child: Text(e.fxu.toString())),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child:
                //                   TableCell(child: Text(e.listxr.toString())),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: TableCell(child: Text(e.fxr.toString())),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: TableCell(
                //                   child: Text(e.listerorr == 0.0
                //                       ? ""
                //                       : e.listerorr.toString())),
                //             ),
                //           ],
                //         )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "result=${(operationsBisection.state as OperationsBisectionAndFalsePositionSuccess).bisectionModal[(operationsBisection.state as OperationsBisectionAndFalsePositionSuccess).bisectionModal.length - 1].listxr}"),
            ],
          )
        ],
      ),
    );
  }
}
