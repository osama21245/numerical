part of 'operations_bloc.dart';

@immutable
sealed class OperationsState {}

final class OperationsInitial extends OperationsState {}

final class OperationsBisectionAndFalsePositionSuccess extends OperationsState {
  final List<BisectionModal> bisectionModal;

  OperationsBisectionAndFalsePositionSuccess({required this.bisectionModal});
}

final class OperationsSimpleFixedPointSuccess extends OperationsState {
  final List<SimpleFixedPointModel> simpleFixedPointModel;

  OperationsSimpleFixedPointSuccess({required this.simpleFixedPointModel});
}

final class OperationsNewtonSuccess extends OperationsState {
  final List<NewtonModel> newtonModel;

  OperationsNewtonSuccess({required this.newtonModel});
}

final class OperationsSecantSucess extends OperationsState {
  final List<SecantModel> secantModel;

  OperationsSecantSucess({required this.secantModel});
}

final class OperationsFaild extends OperationsState {}

final class OperationsLoading extends OperationsState {}
