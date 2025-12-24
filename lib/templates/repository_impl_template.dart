import 'package:packed/utils/utils.dart';

class RepositoryImplTemplate {
  static String repositoryImplTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/${name}_entity.dart';
import '../../domain/repositories/${name}_repository.dart';
import '../datasources/${name}_remote_datasource.dart';

class ${pascal}RepositoryImpl implements ${pascal}Repository {
  final ${pascal}RemoteDataSource remoteDataSource;

  ${pascal}RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ${pascal}Entity>> get${pascal}() async {
    try {
      final result = await remoteDataSource.get${pascal}();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
''';
  }
}
