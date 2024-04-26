import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numerical_analisis/bloc/operations_bloc.dart';
import 'package:numerical_analisis/core/Theme/theme_data.dart';
import 'package:numerical_analisis/home_page_screen.dart';
import 'package:provider/provider.dart';

import 'core/prov/MatricesProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MatricesProvider>(
      create: (context) => MatricesProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OperationsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appDarkTheme,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
