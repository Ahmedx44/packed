import 'dart:io';
import 'package:packed/templates/core_template.dart';
import 'package:packed/utils/utils.dart';

/// A command to initialize the project with core layers and DI.
class GenerateInitCommand {
  /// Runs the command to initialize the project.
  void run() {
    Utils.createDir('lib/core/error');
    Utils.createDir('lib/core/usecases');
    Utils.createDir('lib/core/network');

    Utils.createFile(
      'lib/core/error/failures.dart',
      CoreTemplate.failureTemplate(),
    );
    Utils.createFile(
      'lib/core/usecases/usecase.dart',
      CoreTemplate.usecaseTemplate(),
    );
    Utils.createFile(
      'lib/core/network/network_info.dart',
      CoreTemplate.networkInfoTemplate(),
    );

    if (!File('lib/injection_container.dart').existsSync()) {
      Utils.createFile(
        'lib/injection_container.dart',
        CoreTemplate.injectionContainerTemplate(),
      );
    }

    Utils.addDependencies();

    print(
      'Project initialized with Clean Architecture core layers and DI container',
    );
  }
}
