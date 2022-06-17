
import 'package:flutter/material.dart';
import 'package:phononx_test/pesentation/home/HomeScreenView.dart';
import 'base/utilities/DependencyInjection.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(
        home: HomeScreenView(),
      );

}