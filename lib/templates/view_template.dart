import 'package:packed/utils/utils.dart';

class ViewTemplate {
  static String viewTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/${name}_cubit.dart';
import '../cubit/${name}_state.dart';

class ${pascal}View extends StatelessWidget {
  const ${pascal}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pascal'),
      ),
      body: BlocBuilder<${pascal}Cubit, ${pascal}State>(
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
