import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/core/usecases/usecase.dart';
import 'package:rebuild/feature/domain/entities/response_entity.dart';
import 'package:rebuild/feature/domain/repositories/responses_repository.dart';

class UpdateResponse extends UseCase<void, UpdateResponseParams>{
  final ResponsesRepository itemRepository;

  UpdateResponse(this.itemRepository);

  @override
  Future<Either<Failure, void>> call(UpdateResponseParams params) async {
    final response = await itemRepository.updateResponse(params.response);
    return response;
  }
}

class UpdateResponseParams extends Equatable{
  final ResponseEntity response;

  const UpdateResponseParams(this.response);

  @override
  get props => [response];
}