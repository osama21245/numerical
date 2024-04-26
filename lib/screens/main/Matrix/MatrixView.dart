import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:numerical_analisis/screens/main/Matrix/MatrixNavigator.dart';
import 'package:numerical_analisis/screens/main/Matrix/MatrixViweModel.dart';
import 'package:numerical_analisis/screens/main/Matrix/Widgets/Form.dart';

import 'package:provider/provider.dart';

import '../../../core/prov/MatricesProvider.dart';
import '../../result/matrix/MatricesResultScreen.dart';
import 'Widgets/MatrixButton.dart';

class MatrixScreen extends StatefulWidget {
  static const String routeName = 'matrix screen ';

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen>
    implements MatrixNavigator {
  MatriXViewModel viewModel = MatriXViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.provider = Provider.of<MatricesProvider>(context, listen: false);
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
    viewModel.navigator = null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> methods = [
      MyForm(viewModel),
      MatrixButton(
          "assets/images/Gauss.png", () => viewModel.gaussElimination(context)),
      MatrixButton("assets/images/GaussJordan.png",
          () => viewModel.calcGaussJordan(context)),
      MatrixButton(
          "assets/images/LU.png", () => viewModel.calcMatrixWithLU(context)),
      MatrixButton(
          "assets/images/Cramer.png", () => viewModel.calcCramer(context)),
    ];
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.transparent,
          body: Consumer<MatriXViewModel>(
            builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: methods,
                  options: CarouselOptions(
                    height: 550,
                    viewportFraction: 0.4,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToResultScreen() {
    Navigator.pushNamed(context, MatricesResultScreen.routeName);
  }
}
