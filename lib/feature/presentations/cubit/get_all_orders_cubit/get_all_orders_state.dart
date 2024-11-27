import 'package:equatable/equatable.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';

abstract class GetAllOrdersState extends Equatable {
  const GetAllOrdersState();

  @override
  List<Object> get props => [];
}

class GetAllOrdersInitial extends GetAllOrdersState {}

class GetAllOrdersLoadingState extends GetAllOrdersState{}


class GetAllOrdersSuccessState extends GetAllOrdersState {
  final List<OrderEntity> orders;
  
  const GetAllOrdersSuccessState({
    required this.orders,
  });

  @override
  List<Object> get props => [orders];
}

class GetAllOrdersFailState extends GetAllOrdersState {
  final String message;
  
  const GetAllOrdersFailState({
    required this.message
  });

  @override
  List<Object> get props => [message];
}
