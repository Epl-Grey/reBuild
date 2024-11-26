import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/response_entity.dart';
import 'package:rebuild/feature/domain/repositories/responses_repository.dart';

class CreateResponse extends UseCase<void, CreateResponseParams>{
  final ResponsesRepository responseRepository;

  CreateResponse(this.responseRepository);

  @override
  Future<Either<Failure, void>> call(CreateResponseParams params) async {
    final response = await responseRepository.createResponse(params.response);
    return response;
  }
}

class CreateResponseParams extends Equatable{
  final ResponseEntity response;

  const CreateResponseParams(this.response);

  @override
  get props => [response];
}