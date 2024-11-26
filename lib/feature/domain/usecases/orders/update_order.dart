import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';
import 'package:rebuild/feature/domain/repositories/orders_repository.dart';

class UpdateOrder extends UseCase<void, UpdateOrderParams>{
  final OrdersRepository itemRepository;

  UpdateOrder(this.itemRepository);

  @override
  Future<Either<Failure, void>> call(UpdateOrderParams params) async {
    final response = await itemRepository.updateOrder(params.order);
    return response;
  }
}

class UpdateOrderParams extends Equatable{
  final OrderEntity order;

  const UpdateOrderParams(this.order);

  @override
  get props => [order];
}