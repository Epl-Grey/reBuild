import 'package:dartz/dartz.dart';
import 'package:rebuild/core/error/exception.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/feature/data/datasources/responses_remote_data_source.dart';
import 'package:rebuild/feature/data/models/response_model.dart';
import 'package:rebuild/feature/domain/entities/response_entity.dart';
import 'package:rebuild/feature/domain/repositories/responses_repository.dart';

class ResponsesRepositoryImpl extends ResponsesRepository{
  final ResponsesRemoteDataSource remoteDataSource;

  ResponsesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> createResponse(ResponseEntity response) async {
    return await _setData(() async => 
      remoteDataSource.createResponse(response as ResponseModel)
    );
  }

  @override
  Future<Either<Failure, List<ResponseEntity>>> getResponses() async {
    return await _getResponses(() async =>
      remoteDataSource.getResponses()
    );
  }

  @override
  Future<Either<Failure, void>> updateResponse(ResponseEntity response) async {
    return await _setData(() async =>
      remoteDataSource.updateResponse(response as ResponseModel)
    );
  }

  @override
  Future<Either<Failure, void>> deleteResponse(ResponseEntity response) async {
    return await _setData(() async =>
      remoteDataSource.deleteResponse(response as ResponseModel)
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

  Future<Either<ServerFailure, List<ResponseModel>>> _getResponses(
    Future<List<ResponseModel>> Function() getResponses
  ) async {
    try{
      final response = await getResponses();
      return Right(response);
    }on ServerException catch(error){
      return Left(ServerFailure(message: error.message));
    }catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }
}