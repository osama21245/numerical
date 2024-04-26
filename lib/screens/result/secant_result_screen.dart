import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:numerical_analisis/core/Theme/app_pallete.dart';

class SecantResultScreen extends StatefulWidget {
  const SecantResultScreen({super.key});

  @override
  State<SecantResultScreen> createState() => _SecantResultScreenState();
}

class _SecantResultScreenState extends State<SecantResultScreen> {
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
                      child: TableCell(child: Text("xi-1")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("fxi-1")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("xi")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("fxi")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TableCell(child: Text("erorr")),
                    ),
                  ],
                ),

                ...List.generate(
                    (operationsBisection.state as OperationsSecantSucess)
                        .secantModel
                        .length, (index) {
                  final value =
                      (operationsBisection.state as OperationsSecantSucess)
                          .secantModel[index];
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(index.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.ximinus.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            TableCell(child: Text(value.fximinus.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.xi.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(child: Text(value.fxi.toString())),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TableCell(
                            child: Text(value.erorr == 0.0
                                ? ""
                                : value.erorr.toString())),
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
                  "result=${(operationsBisection.state as OperationsSecantSucess).secantModel[(operationsBisection.state as OperationsSecantSucess).secantModel.length - 1].xi}"),
            ],
          )
        ],
      ),
    );
  }
}
