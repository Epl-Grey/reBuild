import 'package:dartz/dartz.dart';
import 'package:rebuild/core/error/exception.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/feature/data/datasources/orders_remote_data_source.dart';
import 'package:rebuild/feature/data/models/order_model.dart';
import 'package:rebuild/feature/domain/entities/order_entity.dart';
import 'package:rebuild/feature/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl extends OrdersRepository{
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> createOrder(OrderEntity order) async {
    return await _setData(() async => 
      remoteDataSource.createOrder(order as OrderModel)
    );
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders({bool? isDone, String? userId}) async {
    return await _getOrders(() async =>
      remoteDataSource.getOrders(isDone: isDone, userId: userId)
    );
  }

  @override
  Future<Either<Failure, void>> updateOrder(OrderEntity order) async {
    return await _setData(() async =>
      remoteDataSource.updateOrder(order as OrderModel)
    );
  }

  @override
  Future<Either<Failure, void>> deleteOrder(OrderEntity order) async {
    return await _setData(() async =>
      remoteDataSource.deleteOrder(order as OrderModel)
    );
  }

  Future<Either<ServerFailure, void>> _setData(
    Future<void> Function() setData
  ) async {
    try{
      final response = await setData();
      return Right(response);
    }on ServerException catch(error){
      return Left(ServerFailure(message: error.message));
    }catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }

  Future<Either<ServerFailure, List<OrderModel>>> _getOrders(
    Future<List<OrderModel>> Function() getOrders
  ) async {
    try{
      final response = await getOrders();
      return Right(response);
    }on ServerException catch(error){
      return Left(ServerFailure(message: error.message));
    }catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }
}