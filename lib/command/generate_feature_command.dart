import 'dart:io';

import 'package:packed/templates/cubit_template.dart';
import 'package:packed/templates/page_template.dart';
import 'package:packed/templates/state_template.dart';
import 'package:packed/templates/view_template.dart';
import 'package:packed/templates/entity_template.dart';
import 'package:packed/templates/repository_template.dart';
import 'package:packed/templates/usecase_template.dart';
import 'package:packed/templates/model_template.dart';
import 'package:packed/templates/datasource_template.dart';
import 'package:packed/templates/repository_impl_template.dart';
import 'package:packed/templates/di_template.dart';
import 'package:packed/utils/utils.dart';

class GenerateFeatureCommand {
  void run(String name) {
    final featureSnake = Utils.snake(name);
    final featurePascal = Utils.pascal(name);
    final basePath = 'lib/features/$featureSnake';

    _addDependencies();

    // DI
    _createDir('$basePath/di');
    _createFile(
      '$basePath/di/${featureSnake}_di.dart',
      DiTemplate.diTemplate(featureSnake),
    );

    // Presentation Layer
    _createDir('$basePath/presentation/cubit');
    _createDir('$basePath/presentation/pages');
    _createDir('$basePath/presentation/widgets');

    _createFile(
      '$basePath/presentation/cubit/${featureSnake}_cubit.dart',
      CubitTemplate.cubitTemplate(featureSnake),
    );

    _createFile(
      '$basePath/presentation/cubit/${featureSnake}_state.dart',
      StateTemplate.stateTemplate(featureSnake),
    );

    _createFile(
      '$basePath/presentation/pages/${featureSnake}_page.dart',
      PageTemplate.pageTemplate(featureSnake),
    );

    _createFile(
      '$basePath/presentation/pages/${featureSnake}_view.dart',
      ViewTemplate.viewTemplate(featureSnake),
    );

    // Domain Layer
    _createDir('$basePath/domain/entities');
    _createDir('$basePath/domain/repositories');
    _createDir('$basePath/domain/usecases');

    _createFile(
      '$basePath/domain/entities/${featureSnake}_entity.dart',
      EntityTemplate.entityTemplate(featureSnake),
    );

    _createFile(
      '$basePath/domain/repositories/${featureSnake}_repository.dart',
      RepositoryTemplate.repositoryTemplate(featureSnake),
    );

    _createFile(
      '$basePath/domain/usecases/get_${featureSnake}_usecase.dart',
      UsecaseTemplate.usecaseTemplate('get_$featureSnake', featureSnake),
    );

    // Data Layer
    _createDir('$basePath/data/datasources');
    _createDir('$basePath/data/models');
    _createDir('$basePath/data/repositories');

    _createFile(
      '$basePath/data/datasources/${featureSnake}_remote_datasource.dart',
      DatasourceTemplate.datasourceTemplate(featureSnake),
    );

    _createFile(
      '$basePath/data/models/${featureSnake}_model.dart',
      ModelTemplate.modelTemplate(featureSnake),
    );

    _createFile(
      '$basePath/data/repositories/${featureSnake}_repository_impl.dart',
      RepositoryImplTemplate.repositoryImplTemplate(featureSnake),
    );

    print(
      '✅ Feature "$featurePascal" with Clean Architecture generated successfully',
    );
  }

  void _createDir(String path) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  void _createFile(String path, String content) {
    final file = File(path);
    file.writeAsStringSync(content);
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
