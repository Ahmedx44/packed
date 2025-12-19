import 'dart:io';

import 'package:packed/templates/cubit_template.dart';
import 'package:packed/templates/page_template.dart';
import 'package:packed/templates/state_template.dart';
import 'package:packed/templates/view_template.dart';

class GenerateFeatureCommand {
  void run(String name) {
    final featureName = name.toLowerCase();
    final basePath = 'lib/features/$featureName';

    _createDir('${basePath}/cubit');
    _createDir('${basePath}/page');
    _createDir('${basePath}/widget');

    _createFile(
      '$basePath/cubit/${featureName}_cubit.dart',
      CubitTemplate.cubitTemplate(featureName),
    );

    _createFile(
      '$basePath/cubit/${featureName}_state.dart',
      StateTemplate.stateTemplate(featureName),
    );

    _createFile(
      '$basePath/page/${featureName}_page.dart',
      PageTemplate.pageTemplate(featureName),
    );

    _createFile(
      '$basePath/page/${featureName}_view.dart',
      ViewTemplate.viewTemplate(featureName),
    );

    print('✅ Feature "$featureName" generated successfully');
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
}
