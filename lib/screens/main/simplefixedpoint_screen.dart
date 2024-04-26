import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/Theme/MyTheme.dart';
import '../Calculator/CalculatorScreenViewModel.dart';
import '../Calculator/MyButton.dart';
import '../result/simplefixedpoint_result_screen.dart';

class SimpleFixedPointScreen extends StatefulWidget {
  @override
  _SimpleFixedPointScreenState createState() => _SimpleFixedPointScreenState();
}

class _SimpleFixedPointScreenState extends State<SimpleFixedPointScreen> {
  TextEditingController functionController = TextEditingController();
  TextEditingController xiController = TextEditingController();
  TextEditingController errorController = TextEditingController();
  CalculatorScreenViewModel viewModel = CalculatorScreenViewModel();

  @override
  Widget build(BuildContext context) {
    OperationsBloc operationsBloc = BlocProvider.of<OperationsBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Simple Fixed Point"),
        ),
        body: BlocConsumer<OperationsBloc, OperationsState>(
          listener: (context, state) {
            if (state is OperationsSimpleFixedPointSuccess) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SimpleFixedPointResultScreen()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("error Bad state")));
            }
          },
          builder: (context, state) {
            if (state is OperationsLoading) {
              return const CircularProgressIndicator.adaptive();
            }
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: xiController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Enter xi'),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: errorController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Enter error (%)'),
                    ),
                    const SizedBox(height: 20.0),
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
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        operationsBloc.add(OperationsSimpleFixdPoint(
                            eps: double.parse(errorController.text),
                            xi: double.parse(xiController.text),
                            equation: viewModel.titleOnScreen));
                      },
                      child: const Text('Calculate'),
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
