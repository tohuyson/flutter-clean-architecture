import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:flutter_clean_architecture/features/login/domain/repositories/login_reponsitory.dart';

class PostLogin implements Usecase<Login, Params> {
  final LoginRepository repository;

  PostLogin(this.repository);

  @override
  Future<Either<Failure, Login>?>? call(Params email, Params password) async {
    return repository.postLogin(email.value, password.value);
  }
}

class Params extends Equatable {
  final String value;

  Params(this.value);

  @override
  List<Object?> get props => [value];
}
