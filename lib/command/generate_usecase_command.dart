import 'dart:io';
import 'package:packed/utils/utils.dart';
import 'package:packed/templates/usecase_template.dart';

/// A command to generate a new usecase for an existing feature.
class GenerateUsecaseCommand {
  /// Runs the command to generate a usecase with [usecaseName] for [featureName].
  void run(String usecaseName, String featureName) {
    final nameSnake = Utils.snake(usecaseName);
    final namePascal = Utils.pascal(usecaseName);
    final featureSnake = Utils.snake(featureName);
    final featurePascal = Utils.pascal(featureName);

    final basePath = 'lib/features/$featureSnake';
    final usecasePath = '$basePath/domain/usecases/${nameSnake}_usecase.dart';
    final diPath = '$basePath/di/${featureSnake}_di.dart';

    Utils.addDependencies();

    if (!Directory(basePath).existsSync()) {
      print('Feature "$featurePascal" does not exist');
      return;
    }

    // Create usecase file
    Utils.createFile(
      usecasePath,
      UsecaseTemplate.usecaseTemplate(nameSnake, featureSnake),
    );

    // Update DI file
    Utils.updateDi(diPath, nameSnake, featureSnake);

    print(
      'Usecase "$namePascal" generated and registered in "$featurePascal" feature',
    );
  }
}
