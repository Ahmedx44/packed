import 'package:packed/utils/utils.dart';

class CubitTemplate {
  static String cubitTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '${name}_state.dart';

class ${pascal}Cubit extends Cubit<${pascal}State> {
  ${pascal}Cubit() : super(const ${pascal}State());


}
''';
  }
}
