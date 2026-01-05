import 'package:packed/utils/utils.dart';

class ViewTemplate {
  static String viewTemplate(String name, {bool isBloc = false}) {
    final pascal = Utils.pascal(name);
    final type = isBloc ? 'Bloc' : 'Cubit';
    final folder = isBloc ? 'bloc' : 'cubit';

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../$folder/${name}_$folder.dart';
import '../$folder/${name}_state.dart';

class ${pascal}View extends StatelessWidget {
  const ${pascal}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pascal'),
      ),
      body: BlocBuilder<${pascal}$type, ${pascal}State>(
        builder: (context, state) {
          return const Center(
            child: Text('$pascal View'),
          );
        },
      ),
    );
  }
}
''';
  }
}
