import 'package:get_it/get_it.dart';
import '../domain/repositories/home_repository.dart';
import '../domain/usecases/get_home_usecase.dart';
import '../data/datasources/home_remote_datasource.dart';
import '../data/repositories/home_repository_impl.dart';
import '../presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> initHomeFeature() async {
  // Cubit
  sl.registerFactory(() => HomeCubit(getHomeUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetHomeUseCase(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
