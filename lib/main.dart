import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/pages/splash_page.dart';
import 'package:la_plaza_app/ui/pages/start_page.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'bloc/blocUser.dart';
import 'ui/animations/fade_route_animation.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: OwnColors.mainBlue,
        statusBarIconBrightness: Brightness.light
    ));
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
          ],),
        home: SplashScreen(),
      ),
      bloc: UserBloc(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
        Duration(seconds: 3),(){
      Navigator.push(
          context, FadeRoute(page: StartPage())
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
