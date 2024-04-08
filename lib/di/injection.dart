

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:phononx_test/di/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await locator.init();