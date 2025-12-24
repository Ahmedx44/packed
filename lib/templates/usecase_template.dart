import 'package:packed/utils/utils.dart';

class UsecaseTemplate {
  static String usecaseTemplate(String name, String featureName) {
    final pascal = Utils.pascal(name);
    final featurePascal = Utils.pascal(featureName);

    return '''
import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/${featureName}_entity.dart';
import '../repositories/${featureName}_repository.dart';

class ${pascal}UseCase implements UseCase<${featurePascal}Entity, NoParams> {
  final ${featurePascal}Repository repository;

  ${pascal}UseCase(this.repository);

  @override
  Future<Either<Failure, ${featurePascal}Entity>> call(NoParams params) async {
    return await repository.get${featurePascal}();
  }
}
''';
  }
}
