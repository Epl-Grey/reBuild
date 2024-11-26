import 'package:dartz/dartz.dart';
import 'package:rebuild/core/error/failure.dart';
import 'package:rebuild/feature/data/datasources/user_remote_data_source.dart';
import 'package:rebuild/feature/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSources userRemoteDataSources;

  UserRepositoryImpl({
    required this.userRemoteDataSources,
  });

  @override
  Future<Either<Failure, AuthResponse>> signIn(String email, String password) async{
    try {
          final respone = await userRemoteDataSources.signInUser(email, password);
    return Right(respone);
    } on ServerFailure catch(error) {
      return Left(ServerFailure(message: error.message));
    } catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AuthResponse>> signUp(String email, String password, String name, String surname, bool isCustomer) async{
    try {
          final respone = await userRemoteDataSources.signUpUser(email, password, name, surname, isCustomer);
    return Right(respone);
    } on ServerFailure catch(error) {
      return Left(ServerFailure(message: error.message));
    } catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async{
    try {
          final respone = await userRemoteDataSources.signOutUser();
    return Right(respone);
    } on ServerFailure catch(error) {
      return Left(ServerFailure(message: error.message));
    } catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Either<Failure, String> getMyId() {
    try {
      final respone = userRemoteDataSources.getMyId();
      return Right(respone);
    } on ServerFailure catch(error) {
      return Left(ServerFailure(message: error.message));
    } catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }
}