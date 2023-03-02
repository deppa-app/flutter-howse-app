import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:howse_app/integrations/toc/features/autocapture/presentation/bloc/autocapture_bloc.dart';
import 'package:howse_app/screens/splash_screen.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => AutocaptureBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: CustomColor.primaryColor,
          fontFamily: 'Poppins'
      ),
      home: SplashScreen(),
    );
  }
}