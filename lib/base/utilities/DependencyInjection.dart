
import 'package:get_it/get_it.dart';
import 'package:phononx_test/data/api/ApiClient.dart';
import 'package:phononx_test/data/implementations/datasourcesimpls/UserApiDataSourceImpl.dart';
import 'package:phononx_test/data/implementations/repositoriesimpls/UserRepositoryImpl.dart';
import 'package:phononx_test/data/implementations/usecasesimpls/UserUseCasesImpl.dart';
import 'package:phononx_test/domain/datasources/UserApiDataSource.dart';
import 'package:phononx_test/domain/repositories/UserRepository.dart';
import 'package:phononx_test/domain/usecases/userUseCases.dart';
import 'package:phononx_test/pesentation/home/HomeScreenPresenter.dart';

final serviceLocator = GetIt.instance;

void init(){

  //lazy
  serviceLocator.registerLazySingleton<ApiClient>(() => ApiClient());

  //presenter
  serviceLocator.registerFactory(() => HomeScreenPresenter(serviceLocator()));

  // usecases
  serviceLocator.registerLazySingleton<UserUseCases>(() => UserUseCasesImpl(serviceLocator()));

  // repositories
  serviceLocator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(serviceLocator()));

  // datasources
  serviceLocator.registerLazySingleton<UserApiDataSource>(() => UserApiDataSourceImpl(serviceLocator()));

}