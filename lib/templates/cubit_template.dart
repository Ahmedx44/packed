import 'package:packed/utils/utils.dart';

/// A template class for Cubit files.
class CubitTemplate {
  /// Returns the template for a Cubit class with the given [name].
  static String cubitTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '${name}_state.dart';
import '../../domain/usecases/get_${name}_usecase.dart';

class ${pascal}Cubit extends Cubit<${pascal}State> {
  final Get${pascal}UseCase get${pascal}UseCase;

  ${pascal}Cubit({required this.get${pascal}UseCase}) : super(const ${pascal}State());
}
''';
  }
}
