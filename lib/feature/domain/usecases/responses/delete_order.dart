import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/response_entity.dart';
import 'package:rebuild/feature/domain/repositories/responses_repository.dart';

class DeleteResponse extends UseCase<void, DeleteResponseParams>{
  final ResponsesRepository responseRepository;

  DeleteResponse(this.responseRepository);

  @override
  Future<Either<Failure, void>> call(DeleteResponseParams params) async {
    final response = await responseRepository.deleteResponse(params.response);
    return response;
  }
}

class DeleteResponseParams extends Equatable{
  final ResponseEntity response;

  const DeleteResponseParams(this.response);

  @override
  get props => [response];
}