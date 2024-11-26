import 'package:dartz/dartz.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/feature/domain/entities/response_entity.dart';

abstract class ResponsesRepository {
  Future<Either<Failure, List<ResponseEntity>>> getResponses();
  Future<Either<Failure, void>> createResponse(ResponseEntity response);
  Future<Either<Failure, void>> updateResponse(ResponseEntity response);
  Future<Either<Failure, void>> deleteResponse(ResponseEntity response);
}
