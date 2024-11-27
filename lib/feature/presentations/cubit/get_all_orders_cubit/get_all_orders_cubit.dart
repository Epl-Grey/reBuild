import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebuild/feature/domain/usecases/orders/get_all_orders.dart';
import 'package:rebuild/feature/presentations/cubit/get_all_orders_cubit/get_all_orders_state.dart';

class GetAllOrdersCubit extends Cubit<GetAllOrdersState> {
  final GetOrders getUserOrdersUseCase;

  GetAllOrdersCubit(
    this.getUserOrdersUseCase,
  ) : super(GetAllOrdersInitial());

  getUserOrders(bool isDelivered, DateTime today) async {
    emit(GetAllOrdersLoadingState());
    
    final response = await getUserOrdersUseCase(const GetOrderParams());
    response.fold( 
        (fail) => emit(GetAllOrdersFailState(message: fail.toString())),
        (success) => emit(GetAllOrdersSuccessState(orders: success)));
  }
}
