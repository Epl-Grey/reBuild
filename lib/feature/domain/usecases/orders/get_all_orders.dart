import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';
import 'package:rebuild/feature/domain/repositories/orders_repository.dart';

class GetOrders extends UseCase<List<OrderEntity>, GetOrderParams>{
  final OrdersRepository orderRepository;

  GetOrders(this.orderRepository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(GetOrderParams params) async {
    final response = await orderRepository.getOrders(isDone: params.isDone, userId: params.userId);
    return response;
  }
}

class GetOrderParams extends Equatable{
  final bool? isDone;
  final String? userId;

  const GetOrderParams({
    this.isDone,
    this.userId,
  });

  @override
  get props => [isDone, userId];
}