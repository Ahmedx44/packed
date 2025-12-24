import 'package:packed/utils/utils.dart';

class CubitTemplate {
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
