import 'dart:io';
import 'package:packed/utils/utils.dart';
import 'package:packed/templates/usecase_template.dart';

class GenerateUsecaseCommand {
  void run(String usecaseName, String featureName) {
    final nameSnake = Utils.snake(usecaseName);
    final namePascal = Utils.pascal(usecaseName);
    final featureSnake = Utils.snake(featureName);
    final featurePascal = Utils.pascal(featureName);

    final basePath = 'lib/features/$featureSnake';
    final usecasePath = '$basePath/domain/usecases/${nameSnake}_usecase.dart';
    final diPath = '$basePath/di/${featureSnake}_di.dart';

    _addDependencies();

    if (!Directory(basePath).existsSync()) {
      print('❌ Feature "$featurePascal" does not exist');
      return;
    }

    // Create usecase file
    _createFile(
      usecasePath,
      UsecaseTemplate.usecaseTemplate(nameSnake, featureSnake),
    );

    // Update DI file
    _updateDi(diPath, nameSnake, featureSnake);

    print(
      '✅ Usecase "$namePascal" generated and registered in "$featurePascal" feature',
    );
  }

  void _createFile(String path, String content) {
    final file = File(path);
    if (file.existsSync()) {
      print('⚠️ Usecase already exists at $path');
      return;
    }
    file.writeAsStringSync(content);
  }

  void _updateDi(String diPath, String name, String feature) {
    final file = File(diPath);
    if (!file.existsSync()) {
      print('⚠️ DI file not found at $diPath. Skipping DI registration.');
      return;
    }

    final content = file.readAsStringSync();
    final pascal = Utils.pascal(name);

    // Add import
    final importLine = "import '../domain/usecases/${name}_usecase.dart';\n";
    if (content.contains(importLine)) return;

    // Find the last import and insert after it
    final lastImportIndex = content.lastIndexOf('import ');
    final endOfImports = content.indexOf('\n', lastImportIndex) + 1;

    var newContent =
        content.substring(0, endOfImports) +
        importLine +
        content.substring(endOfImports);

    // Add registration
    final registrationLine =
        "  sl.registerLazySingleton(() => ${pascal}UseCase(sl()));\n";
    if (newContent.contains(registrationLine)) return;

    // Find // Usecases or // Repository and insert before/after
    if (newContent.contains('// Usecases')) {
      newContent = newContent.replaceFirst(
        '// Usecases',
        '// Usecases\n$registrationLine',
      );
    } else {
      // Fallback: insert before the last closing brace
      final lastBrace = newContent.lastIndexOf('}');
      newContent =
          newContent.substring(0, lastBrace) +
          registrationLine +
          newContent.substring(lastBrace);
    }

    file.writeAsStringSync(newContent);
  }

  void _addDependencies() {
    if (!File('pubspec.yaml').existsSync()) return;

    print('📦 Adding dependencies...');
    Process.runSync('flutter', [
      'pub',
      'add',
      'flutter_bloc',
      'get_it',
      'equatable',
      'dartz',
    ]);
  }
}
