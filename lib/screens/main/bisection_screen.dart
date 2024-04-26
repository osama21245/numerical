import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:numerical_analisis/screens/Calculator/CalculatorScreenViewModel.dart';
import 'package:numerical_analisis/screens/result/bisection_false_result_screen.dart';
import 'package:provider/provider.dart';

import '../../core/Theme/MyTheme.dart';
import '../Calculator/MyButton.dart';

class BisectionScreen extends StatefulWidget {
  @override
  _BisectionScreenState createState() => _BisectionScreenState();
}

class _BisectionScreenState extends State<BisectionScreen> {
  TextEditingController functionController = TextEditingController();
  TextEditingController xlController = TextEditingController();
  TextEditingController xuController = TextEditingController();
  TextEditingController errorController = TextEditingController();
  CalculatorScreenViewModel viewModel = CalculatorScreenViewModel();

  String result = '';

  @override
  Widget build(BuildContext context) {
    OperationsBloc operationsBloc = BlocProvider.of<OperationsBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Bisection"),
        ),
        body: BlocConsumer<OperationsBloc, OperationsState>(
          listener: (context, state) {
            if (state is OperationsBisectionAndFalsePositionSuccess) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BisectionAndFalseResultScreen()));
            } else {}
          },
          builder: (context, state) {
            if (state is OperationsLoading) {
              return CircularProgressIndicator.adaptive();
            }
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: xlController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Enter xl'),
                    ),
                    SizedBox(height: 20.0),

                    TextField(
                      controller: xuController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Enter xu'),
                    ),

                    SizedBox(height: 20.0),

                    TextField(
                      controller: errorController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Enter error (%)'),
                    ),

                    SizedBox(height: 20.0),

                    //-
                    //
                    //
                    //
                    //
                    //
                    //
                    ///
                    //////
                    ///
                    //////
                    //////
                    /////
                    ///
                    ///
                    Container(
                      height: 700,
                      child: ChangeNotifierProvider(
                        create: (context) => viewModel,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              // top Screen
                              Consumer<CalculatorScreenViewModel>(
                                builder: (context, value, child) => Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: MyTheme.black
                                                  .withOpacity(0.4),
                                              blurRadius: 5,
                                              offset: const Offset(0, 5))
                                        ],
                                        color: MyTheme.green),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Text(
                                              value.titleOnScreen,
                                              style: const TextStyle(
                                                  color: MyTheme.black,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            Text(
                                              value.validationMessage,
                                              style: const TextStyle(
                                                  color: MyTheme.gray,
                                                  fontSize: 22,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyButton(
                                        title: "(",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: ")",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "log10(",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "^",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "e",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "/",
                                        type: "op",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyButton(
                                        title: "sin(",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "cos(",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "7",
                                        type: "num",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "8",
                                        type: "num",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "9",
                                        type: "num",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "*",
                                        type: "op",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyButton(
                                        title: "tan(",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "x",
                                        type: "math",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "4",
                                        type: "num",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "5",
                                        type: "num",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "6",
                                        type: "num",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                    MyButton(
                                        title: "-",
                                        type: "op",
                                        changeTitleOnScreen:
                                            changeTitleOnScreen),
                                  ],
                                ),
                              ),

                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          MyButton(
                                              title: "Home",
                                              type: "op",
                                              changeTitleOnScreen:
                                                  changeTitleOnScreen),
                                        ],
                                      )),
                                      Expanded(
                                          flex: 5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  MyButton(
                                                      title: "Back",
                                                      type: "math",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: "1",
                                                      type: "num",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: "2",
                                                      type: "num",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: "3",
                                                      type: "num",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: "+",
                                                      type: "op",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                ],
                                              )),
                                              Expanded(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  MyButton(
                                                      title: "Clear",
                                                      type: "math",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: "0",
                                                      type: "num",
                                                      flex: 2,
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: ".",
                                                      type: "num",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                  MyButton(
                                                      title: "Next",
                                                      type: "op",
                                                      changeTitleOnScreen:
                                                          changeTitleOnScreen),
                                                ],
                                              ))
                                            ],
                                          )),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        operationsBloc.add(OperationsBisection(
                            equation: viewModel.titleOnScreen,
                            xl: double.parse(xlController.text),
                            xu: double.parse(xuController.text),
                            eps: double.parse(errorController.text)));
                      },
                      child: Text('Calculate'),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      result,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void changeTitleOnScreen(String title) {
    viewModel.changeTitleOnScreen(title);
  }
}