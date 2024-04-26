// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'operations_bloc.dart';

@immutable
sealed class OperationsEvent {}

// ignore: must_be_immutable
class OperationsBisection extends OperationsEvent {
  double xl;
  double xu;
  double eps;
  String equation;
  OperationsBisection({
    required this.xl,
    required this.xu,
    required this.eps,
    required this.equation,
  });
}

// ignore: must_be_immutable
class OperationsFalsePosition extends OperationsEvent {
  double xl;
  double xu;
  double eps;
  String equation;
  OperationsFalsePosition({
    required this.xl,
    required this.xu,
    required this.eps,
    required this.equation,
  });
}

// ignore: must_be_immutable
class OperationsSimpleFixdPoint extends OperationsEvent {
  double xi;
  double eps;
  String equation;
  OperationsSimpleFixdPoint({
    required this.xi,
    required this.eps,
    required this.equation,
  });
}

class OperationsNewton extends OperationsEvent {
  double xi;
  double eps;
  String equation;
  OperationsNewton({
    required this.xi,
    required this.eps,
    required this.equation,
  });
}

// ignore: must_be_immutable
class OperationsSecant extends OperationsEvent {
  double xiMinus;
  double xi;
  double eps;
  String equation;
  OperationsSecant(
      {required this.xiMinus,
      required this.xi,
      required this.eps,
      required this.equation});
}
