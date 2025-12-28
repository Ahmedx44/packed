import 'package:packed/utils/utils.dart';

/// A template class for Bloc Event files.
class EventTemplate {
  /// Returns the template for a Bloc Event class with the given [name].
  static String eventTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:equatable/equatable.dart';

abstract class ${pascal}Event extends Equatable {
  const ${pascal}Event();

  @override
  List<Object> get props => [];
}

class Get${pascal}Event extends ${pascal}Event {}
''';
  }
}
