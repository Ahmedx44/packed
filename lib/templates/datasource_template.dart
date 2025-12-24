import 'package:packed/utils/utils.dart';

class DatasourceTemplate {
  static String datasourceTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
abstract class ${pascal}RemoteDataSource {
  // TODO: Add datasource methods
}

class ${pascal}RemoteDataSourceImpl implements ${pascal}RemoteDataSource {
  // final HttpClient client;
  // ${pascal}RemoteDataSourceImpl(this.client);
}
''';
  }
}
