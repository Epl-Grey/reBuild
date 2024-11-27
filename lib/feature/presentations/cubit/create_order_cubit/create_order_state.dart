part of 'create_order_cubit.dart';

sealed class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object> get props => [];
}

final class CreateOrderInitial extends CreateOrderState {}

final class CreateOrderLoading extends CreateOrderState {}

final class CreateOrderSuccess extends CreateOrderState {}

final class CreateOrderFailure extends CreateOrderState {
  final String message;

  const CreateOrderFailure(this.message);

  @override
  get props => [message];
}
