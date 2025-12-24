import 'dart:io';
import 'package:packed/templates/core_template.dart';

class GenerateInitCommand {
  void run() {
    _createDir('lib/core/error');
    _createDir('lib/core/usecases');
    _createDir('lib/core/network');

    _createFile('lib/core/error/failures.dart', CoreTemplate.failureTemplate());
    _createFile(
      'lib/core/usecases/usecase.dart',
      CoreTemplate.usecaseTemplate(),
    );
    _createFile(
      'lib/core/network/network_info.dart',
      CoreTemplate.networkInfoTemplate(),
    );

    if (!File('lib/injection_container.dart').existsSync()) {
      _createFile(
        'lib/injection_container.dart',
        CoreTemplate.injectionContainerTemplate(),
      );
    }

    _addDependencies();

    print(
      '✅ Project initialized with Clean Architecture core layers and DI container',
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
    if (file.existsSync()) {
      print('⚠️ File already exists at $path');
      return;
    }
    file.writeAsStringSync(content);
  }

  void _addDependencies() {
    if (!File('pubspec.yaml').existsSync()) return;

    print('📦 Adding core dependencies...');
    Process.runSync('flutter', [
      'pub',
      'add',
      'internet_connection_checker',
      'equatable',
      'dartz',
      'get_it',
      'flutter_bloc',
    ]);
  }
}
