import 'package:deppa_app/screens/auth/sign_up_basics.dart';
import 'package:deppa_app/screens/splash_screen.dart';
import 'package:deppa_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/autocapture/presentation/bloc/autocapture_bloc.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiBlocProvider(
      providers: [
        //ChangeNotifierProvider( create: (_) => AuthService() ),
        BlocProvider(create: (_) => AutocaptureBloc()),
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Deppa App',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const SplashScreen(),
      //home: const SignUpBasics(),
    );
  }
}
