import 'package:dartz/dartz.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, void>> createOrder(OrderEntity order);
  Future<Either<Failure, void>> updateOrder(OrderEntity order);
  Future<Either<Failure, void>> deleteOrder(OrderEntity order);
}
