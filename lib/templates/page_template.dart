import 'package:packed/utils/utils.dart';

class PageTemplate {
  static String pageTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/${name}_cubit.dart';
import '${name}_view.dart';

class ${pascal}Page extends StatelessWidget {
  const ${pascal}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ${pascal}Cubit(),
      child: const ${pascal}View(),
    );
  }
}
''';
  }
}
