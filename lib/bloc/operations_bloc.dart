import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';
import 'package:numerical_analisis/models/bisection_or_falseposition_model.dart';
import 'package:numerical_analisis/models/newton_model.dart';
import 'package:numerical_analisis/models/simplefixedpoint_model%20copy.dart';
import 'package:numerical_analisis/models/simplefixedpoint_model.dart';
part 'operations_event.dart';
part 'operations_state.dart';

class OperationsBloc extends Bloc<OperationsEvent, OperationsState> {
  OperationsBloc() : super(OperationsInitial()) {
    on<OperationsBisection>(_operationBisection);
    on<OperationsFalsePosition>(_operationFalsePosition);
    on<OperationsSimpleFixdPoint>(_operationSimpleFixedPoint);
    on<OperationsNewton>(_operationNewton);
    on<OperationsSecant>(_operationSecant);
  }

  void _operationBisection(
      OperationsBisection event, Emitter<OperationsState> emit) {
    emit(OperationsLoading());

    List<BisectionModal> bisectionMoadlList = [];

    double xr = 0.0, xrOld = 0.0, error = 0.0;
    int iteration = 0;

    do {
      xrOld = xr;
      xr = (event.xl + event.xu) / 2;
      error = (xr - xrOld).abs() / xr * 100;

      BisectionModal bisectionModal = BisectionModal(
          index: iteration,
          xl: event.xl,
          fxl: f(event.xl, event.equation),
          xu: event.xu,
          fxu: f(event.xu, event.equation),
          listxr: xr,
          fxr: f(xr, event.equation),
          listerorr: iteration == 0 ? 0.0 : error);
      bisectionMoadlList.add(bisectionModal);

      if (f(event.xl, event.equation) * f(xr, event.equation) > 0) {
        event.xl = xr;
      } else {
        event.xu = xr;
      }
      iteration++;
    } while (error > event.eps || error.isNaN || error.isInfinite);

    emit(OperationsBisectionAndFalsePositionSuccess(
        bisectionModal: bisectionMoadlList));
  }

  void _operationFalsePosition(
      OperationsFalsePosition event, Emitter<OperationsState> emit) {
    emit(OperationsLoading());

    List<BisectionModal> bisectionMoadlList = [];
    double xr = 0.0, xrOld = 0.0, error = 0.0;
    int iteration = 0;

    do {
      xrOld = xr;
      xr = event.xu -
          (f(event.xu, event.equation) * (event.xl - event.xu)) /
              (f(event.xl, event.equation) - f(event.xu, event.equation));
      error = (xr - xrOld).abs() / xr * 100;

      BisectionModal bisectionModal = BisectionModal(
          index: iteration,
          xl: event.xl,
          fxl: f(event.xl, event.equation),
          xu: event.xu,
          fxu: f(event.xu, event.equation),
          listxr: xr,
          fxr: f(xr, event.equation),
          listerorr: iteration == 0 ? 0.0 : error);
      bisectionMoadlList.add(bisectionModal);

      if (f(event.xl, event.equation) * f(xr, event.equation) > 0) {
        event.xl = xr;
      } else {
        event.xu = xr;
      }
      iteration++;
    } while (error > event.eps || error.isNaN || error.isInfinite);

    emit(OperationsBisectionAndFalsePositionSuccess(
        bisectionModal: bisectionMoadlList));
  }

  void _operationSimpleFixedPoint(
      OperationsSimpleFixdPoint event, Emitter<OperationsState> emit) {
    emit(OperationsLoading());

    List<SimpleFixedPointModel> simpleFixedPointModelList = [];

    double xi = 0.0, xiPlus1 = 0.0, error = 0.0;
    int iteration = 0;

    simpleFixedFunction(double xiInitial) {
      xi = xiInitial;
      xiPlus1 = f(xi, event.equation);
      error = (xiPlus1 - xi).abs() / xiPlus1 * 100;

      SimpleFixedPointModel simpleFixedModal = SimpleFixedPointModel(
          index: iteration,
          xi: xi,
          xiPlus1: xiPlus1,
          erorr: iteration == 0 ? 0.0 : error);
      simpleFixedPointModelList.add(simpleFixedModal);
      iteration++;
      if (error > event.eps) {
        simpleFixedFunction(xiPlus1);
      }
    }

    simpleFixedFunction(event.xi);
    emit(OperationsSimpleFixedPointSuccess(
        simpleFixedPointModel: simpleFixedPointModelList));
  }

  void _operationNewton(OperationsNewton event, Emitter<OperationsState> emit) {
    emit(OperationsLoading());

    List<NewtonModel> simpleFixedPointModelList = [];

    double xi = 0.0, xiPlus1 = 0.0, error = 0.0;
    int iteration = 0;

    NewtonFunction(double xiInitial) {
      xi = xiInitial;
      xiPlus1 = xi - f(xi, event.equation) / fdash(xi, event.equation);
      error = (xiPlus1 - xi).abs() / xiPlus1 * 100;

      NewtonModel newtonModel = NewtonModel(
          index: iteration,
          xi: xi,
          fxi: f(xi, event.equation),
          fxidash: fdash(xi, event.equation),
          erorr: error);
      simpleFixedPointModelList.add(newtonModel);
      iteration++;
      if (error > event.eps) {
        NewtonFunction(xiPlus1);
      }
    }

    NewtonFunction(event.xi);
    emit(OperationsNewtonSuccess(newtonModel: simpleFixedPointModelList));
  }

  void _operationSecant(OperationsSecant event, Emitter<OperationsState> emit) {
    emit(OperationsLoading());

    List<SecantModel> secantModelList = [];

    double error = 0.0;
    int iteration = 0;

    double secant(double xiMinus1, double xi) {
      double xiOld = xi;
      error = ((xi - xiMinus1) / xi).abs() * 100;
      SecantModel secantModal = SecantModel(
          index: iteration,
          xi: xi,
          ximinus: xiMinus1,
          fxi: f(xi, event.equation),
          fximinus: f(xiMinus1, event.equation),
          erorr: iteration == 0 ? 0.0 : error);
      secantModelList.add(secantModal);
      xi = xi -
          ((f(xi, event.equation) * (xiMinus1 - xi)) /
              (f(xiMinus1, event.equation) - f(xi, event.equation)));
      xiMinus1 = xiOld;

      iteration++;
      if (error > event.eps) {
        return secant(
          xiMinus1,
          xi,
        );
      } else {
        return xi;
      }
    }

    secant(event.xiMinus, event.xi);

    // secantFunction(double xiInitial, double ximinusInitial) {
    //   xiOld = xiInitial;
    //   error = (xiPlus1 - xiOld).abs() / xiPlus1 * 100;
    //   ximinusInitial = xiOld;
    //   xiInitial = xiInitial -
    //       ((f(xiInitial, event.equation) * (ximinusInitial - xiInitial)) /
    //           (f(ximinusInitial, event.equation) -
    //               f(ximinusInitial, event.equation)));
    // SecantModel secantModal = SecantModel(
    //     index: iteration,
    //     xi: xiInitial,
    //     ximinus: ximinusInitial,
    //     fxi: f(xiInitial, event.equation),
    //     fximinus: f(ximinusInitial, event.equation),
    //     erorr: iteration == 0 ? 0.0 : error);
    // secantModelList.add(secantModal);

    //   iteration++;
    //   if (error > event.eps) {
    //     secantFunction(xiInitial, ximinusInitial);
    //   }
    // }

    // secantFunction(event.xi, event.xiMinus);
    emit(OperationsSecantSucess(secantModel: secantModelList));
  }

  // Define your function here
  double f(double x, String equation) {
    Parser parser = Parser();
    Expression exp = parser.parse(equation);
    ContextModel cm = ContextModel();
    cm.bindVariable(Variable('x'), Number(x));
    double result = exp.evaluate(EvaluationType.REAL, cm);
    return result;
  }

  double fdash(double x, String equation) {
    Parser p = Parser();
    Expression exp = p.parse(equation);
    Expression expDerived = exp.derive('x');
    ContextModel cm = ContextModel();
    cm.bindVariable(Variable('x'), Number(x));
    return expDerived.evaluate(EvaluationType.REAL, cm);
  }
}
//-9*x^2+1.7*x+2.5
//0.95*x^3-5.9*x^2+10.9*x-6