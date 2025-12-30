import 'package:packed/utils/utils.dart';

/// A template class for Dependency Injection files.
class DiTemplate {
  /// Returns the template for a DI registration file for the given [name].
  static String diTemplate(String name, {bool isBloc = false}) {
    final pascal = Utils.pascal(name);
    final type = isBloc ? 'Bloc' : 'Cubit';
    final folder = isBloc ? 'bloc' : 'cubit';

    return '''
import 'package:get_it/get_it.dart';
import '../domain/repositories/${name}_repository.dart';
import '../domain/usecases/get_${name}_usecase.dart';
import '../data/datasources/${name}_remote_datasource.dart';
import '../data/repositories/${name}_repository_impl.dart';
import '../presentation/$folder/${name}_$folder.dart';

final sl = GetIt.instance;

Future<void> init${pascal}Feature() async {
  // $type
  sl.registerFactory(() => ${pascal}$type(get${pascal}UseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => Get${pascal}UseCase(sl()));

  // Repository
  sl.registerLazySingleton<${pascal}Repository>(
    () => ${pascal}RepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<${pascal}RemoteDataSource>(
    () => ${pascal}RemoteDataSourceImpl.instance,
  );
}
''';
  }
}
