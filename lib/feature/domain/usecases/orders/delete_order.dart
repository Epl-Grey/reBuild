import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';
import 'package:rebuild/feature/domain/repositories/orders_repository.dart';

class DeleteOrder extends UseCase<void, DeleteOrderParams>{
  final OrdersRepository orderRepository;

  DeleteOrder(this.orderRepository);

  @override
  Future<Either<Failure, void>> call(DeleteOrderParams params) async {
    final response = await orderRepository.deleteOrder(params.order);
    return response;
  }
}

class DeleteOrderParams extends Equatable{
  final OrderEntity order;

  const DeleteOrderParams(this.order);

  @override
  get props => [order];
}