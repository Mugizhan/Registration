import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/data/repository/register_repository.dart';
import 'package:form1/data/repository/statistics_repository.dart';
import 'package:form1/router/router_config.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context)=>RegisterRepository()),
          RepositoryProvider(create: (context)=>StatisticRepository())
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ));
  }
}
