import 'package:packed/utils/utils.dart';

class DatasourceTemplate {
  static String datasourceTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import '../models/${name}_model.dart';

abstract class ${pascal}RemoteDataSource {
  Future<${pascal}Model> get${pascal}();
}

class ${pascal}RemoteDataSourceImpl implements ${pascal}RemoteDataSource {
  // final HttpClient client;
  // ${pascal}RemoteDataSourceImpl(this.client);

  @override
  Future<${pascal}Model> get${pascal}() async {
    // TODO: Implement remote data source
    return const ${pascal}Model();
  }
}
''';
  }
}
