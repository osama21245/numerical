import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

class CustomSqrtFunction extends MathFunction {
  CustomSqrtFunction()
      : super('sqrt', []); // Constructor specifying function name and arity

  double eval(List<double> args) {
    // Evaluate the square root function
    return math.sqrt(args[0]);
  }

  @override
  evaluate(EvaluationType type, ContextModel context) {
    throw UnimplementedError();
  }

  @override
  Expression derive(String toVar) {
    // TODO: implement derive
    throw UnimplementedError();
  }
}
