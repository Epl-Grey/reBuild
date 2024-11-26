import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/response_entity.dart';
import 'package:rebuild/feature/domain/repositories/responses_repository.dart';

class GetResponses extends UseCase<List<ResponseEntity>, GetResponseParams>{
  final ResponsesRepository responseRepository;

  GetResponses(this.responseRepository);

  @override
  Future<Either<Failure, List<ResponseEntity>>> call(GetResponseParams params) async {
    final response = await responseRepository.getResponses();
    return response;
  }
}

class GetResponseParams extends Equatable{

  const GetResponseParams();

  @override
  get props => [];
}