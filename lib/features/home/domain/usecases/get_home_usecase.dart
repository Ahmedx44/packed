import 'package:dartz/dartz.dart';
import '../repositories/home_repository.dart';

class Get_homeUseCase {
  final HomeRepository repository;

  Get_homeUseCase(this.repository);

  // Future<Either<Failure, dynamic>> call() async {
  //   return await repository.execute();
  // }
}
