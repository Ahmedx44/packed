import 'package:packed/templates/cubit_template.dart';
import 'package:packed/templates/bloc_template.dart';
import 'package:packed/templates/event_template.dart';
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
import 'dart:io';

/// A command to generate a new feature with Clean Architecture layers.
class GenerateFeatureCommand {
  /// Runs the command to generate a feature with the given [name].
  void run(String name) {
    final featureSnake = Utils.snake(name);
    final featurePascal = Utils.pascal(name);
    final basePath = 'lib/features/$featureSnake';

    Utils.addDependencies();

    // Prompt for Cubit or Bloc
    print('Choose state management:');
    print('1. Cubit (Default)');
    print('2. Bloc');
    stdout.write('Enter choice (1 or 2): ');
    final choice = stdin.readLineSync()?.trim();
    final isBloc = choice == '2';
    final stateManagement = isBloc ? 'bloc' : 'cubit';

    // DI
    Utils.createDir('$basePath/di');
    Utils.createFile(
      '$basePath/di/${featureSnake}_di.dart',
      DiTemplate.diTemplate(featureSnake, isBloc: isBloc),
    );

    // Presentation Layer
    Utils.createDir('$basePath/presentation/$stateManagement');
    Utils.createDir('$basePath/presentation/pages');
    Utils.createDir('$basePath/presentation/widgets');

    if (isBloc) {
      Utils.createFile(
        '$basePath/presentation/bloc/${featureSnake}_bloc.dart',
        BlocTemplate.blocTemplate(featureSnake),
      );
      Utils.createFile(
        '$basePath/presentation/bloc/${featureSnake}_event.dart',
        EventTemplate.eventTemplate(featureSnake),
      );
      Utils.createFile(
        '$basePath/presentation/bloc/${featureSnake}_state.dart',
        StateTemplate.stateTemplate(featureSnake),
      );
    } else {
      Utils.createFile(
        '$basePath/presentation/cubit/${featureSnake}_cubit.dart',
        CubitTemplate.cubitTemplate(featureSnake),
      );
      Utils.createFile(
        '$basePath/presentation/cubit/${featureSnake}_state.dart',
        StateTemplate.stateTemplate(featureSnake),
      );
    }

    Utils.createFile(
      '$basePath/presentation/pages/${featureSnake}_page.dart',
      PageTemplate.pageTemplate(featureSnake, isBloc: isBloc),
    );

    Utils.createFile(
      '$basePath/presentation/pages/${featureSnake}_view.dart',
      ViewTemplate.viewTemplate(featureSnake, isBloc: isBloc),
    );

    // Domain Layer
    Utils.createDir('$basePath/domain/entities');
    Utils.createDir('$basePath/domain/repositories');
    Utils.createDir('$basePath/domain/usecases');

    Utils.createFile(
      '$basePath/domain/entities/${featureSnake}_entity.dart',
      EntityTemplate.entityTemplate(featureSnake),
    );

    Utils.createFile(
      '$basePath/domain/repositories/${featureSnake}_repository.dart',
      RepositoryTemplate.repositoryTemplate(featureSnake),
    );

    Utils.createFile(
      '$basePath/domain/usecases/get_${featureSnake}_usecase.dart',
      UsecaseTemplate.usecaseTemplate('get_$featureSnake', featureSnake),
    );

    // Data Layer
    Utils.createDir('$basePath/data/datasources');
    Utils.createDir('$basePath/data/models');
    Utils.createDir('$basePath/data/repositories');

    Utils.createFile(
      '$basePath/data/datasources/${featureSnake}_remote_datasource.dart',
      DatasourceTemplate.datasourceTemplate(featureSnake),
    );

    Utils.createFile(
      '$basePath/data/models/${featureSnake}_model.dart',
      ModelTemplate.modelTemplate(featureSnake),
    );

    Utils.createFile(
      '$basePath/data/repositories/${featureSnake}_repository_impl.dart',
      RepositoryImplTemplate.repositoryImplTemplate(featureSnake),
    );

    print(
      'Feature "$featurePascal" with Clean Architecture generated successfully',
    );
  }
}
