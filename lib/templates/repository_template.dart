import 'package:packed/utils/utils.dart';

class RepositoryTemplate {
  static String repositoryTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:dartz/dartz.dart';
import '../entities/${name}_entity.dart';

abstract class ${pascal}Repository {
  // TODO: Add repository methods
}
''';
  }
}
