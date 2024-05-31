import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_global/viewmodel/loading_view_model.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'viewmodel/home_view_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadingState(),
        ),
        ChangeNotifierProxyProvider<LoadingState, HomeViewModel>(
          create: (_) => HomeViewModel(null),
          update: (_, loadingProvider, myProvider) =>
              HomeViewModel(loadingProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
