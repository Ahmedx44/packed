import 'package:packed/utils/utils.dart';

class EntityTemplate {
  static String entityTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:equatable/equatable.dart';

class ${pascal}Entity extends Equatable {
  const ${pascal}Entity();

  @override
  List<Object?> get props => [];
}
''';
  }
}
