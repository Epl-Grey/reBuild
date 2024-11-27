import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';
import 'package:rebuild/feature/domain/usecases/orders/create_order.dart';


part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final CreateOrder createOrderUseCase;

  CreateOrderCubit(this.createOrderUseCase)
      : super(CreateOrderInitial());

  createOrder(OrderEntity order) async {
    emit(CreateOrderLoading());

    final data = await createOrderUseCase(CreateOrderParams(order));

    data.fold(
      (failure) => emit(CreateOrderFailure(failure.toString())),
      (ok) => emit(CreateOrderSuccess())
    );

    if (state is CreateOrderFailure) return;
    
  }
}
