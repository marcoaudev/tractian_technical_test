import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_technical_test/core/errors/failure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}