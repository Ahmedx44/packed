import 'package:packed/utils/utils.dart';

class PageTemplate {
  static String pageTemplate(String name, {bool isBloc = false}) {
    final pascal = Utils.pascal(name);
    final type = isBloc ? 'Bloc' : 'Cubit';
    final folder = isBloc ? 'bloc' : 'cubit';

    return '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../$folder/${name}_$folder.dart';
import '${name}_view.dart';

class ${pascal}Page extends StatelessWidget {
  const ${pascal}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<${pascal}$type>(),
      child: const ${pascal}View(),
    );
  }
}
''';
  }
}
