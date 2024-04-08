
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'base/app_router.dart';
import 'di/injection.dart';
import 'domain/usecases/users_use_cases.dart';
import 'pesentation/home/home_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers(),
      child: MyMaterialApp(),
    );
  }

  List<SingleChildWidget> _providers()
  => [
    ChangeNotifierProvider(create: (context) => HomeViewModel(locator<UsersUseCases>())),
  ];

}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}