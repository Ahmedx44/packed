import 'package:packed/utils/utils.dart';

/// A template class for Bloc files.
class BlocTemplate {
  /// Returns the template for a Bloc class with the given [name].
  static String blocTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '${name}_event.dart';
import '${name}_state.dart';
import '../../domain/usecases/get_${name}_usecase.dart';

class ${pascal}Bloc extends Bloc<${pascal}Event, ${pascal}State> {
  final Get${pascal}UseCase get${pascal}UseCase;

  ${pascal}Bloc({required this.get${pascal}UseCase}) : super(const ${pascal}State()) {
    on<Get${pascal}Event>(_onGet${pascal}Event);
  }

  Future<void> _onGet${pascal}Event(
    Get${pascal}Event event,
    Emitter<${pascal}State> emit,
  ) async {
    // TODO: Implement event handler
  }
}
''';
  }
}
