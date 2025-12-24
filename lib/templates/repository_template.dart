import 'package:packed/utils/utils.dart';

class RepositoryTemplate {
  static String repositoryTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/${name}_entity.dart';

abstract class ${pascal}Repository {
  Future<Either<Failure, ${pascal}Entity>> get${pascal}();
}
''';
  }
}
