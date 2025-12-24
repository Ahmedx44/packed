import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';

class GetHomeUseCase {
  final HomeRepository repository;

  GetHomeUseCase(this.repository);

  // Future<Either<Failure, dynamic>> call() async {
  //   return await repository.execute();
  // }
}
