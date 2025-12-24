import 'package:packed/utils/utils.dart';

class ModelTemplate {
  static String modelTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import '../../domain/entities/${name}_entity.dart';

class ${pascal}Model extends ${pascal}Entity {
  const ${pascal}Model();

  factory ${pascal}Model.fromJson(Map<String, dynamic> json) {
    return const ${pascal}Model();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
''';
  }
}
