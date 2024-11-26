import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';
import 'package:rebuild/feature/domain/repositories/orders_repository.dart';

class CreateOrder extends UseCase<void, CreateOrderParams>{
  final OrdersRepository orderRepository;

  CreateOrder(this.orderRepository);

  @override
  Future<Either<Failure, void>> call(CreateOrderParams params) async {
    final response = await orderRepository.createOrder(params.order);
    return response;
  }
}

class CreateOrderParams extends Equatable{
  final OrderEntity order;

  const CreateOrderParams(this.order);

  @override
  get props => [order];
}