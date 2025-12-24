import 'package:packed/utils/utils.dart';

class UsecaseTemplate {
  static String usecaseTemplate(String name, String featureName) {
    final pascal = Utils.pascal(name);
    final featurePascal = Utils.pascal(featureName);

    return '''
import 'package:dartz/dartz.dart';
import '../repositories/${featureName}_repository.dart';

class ${pascal}UseCase {
  final ${featurePascal}Repository repository;

  ${pascal}UseCase(this.repository);

  // Future<Either<Failure, dynamic>> call() async {
  //   return await repository.execute();
  // }
}
''';
  }
}
