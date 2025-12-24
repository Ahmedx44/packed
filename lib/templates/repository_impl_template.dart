import 'package:packed/utils/utils.dart';

class RepositoryImplTemplate {
  static String repositoryImplTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import '../../domain/repositories/${name}_repository.dart';
import '../datasources/${name}_remote_datasource.dart';

class ${pascal}RepositoryImpl implements ${pascal}Repository {
  final ${pascal}RemoteDataSource remoteDataSource;

  ${pascal}RepositoryImpl({required this.remoteDataSource});

  // TODO: Implement repository methods
}
''';
  }
}
