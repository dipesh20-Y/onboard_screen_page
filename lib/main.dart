import 'package:flutter/material.dart';
import './onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home_page.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs= await SharedPreferences.getInstance();
  final showHome= prefs.getBool('showHome') ?? false;

  runApp( MyApp(showHome: showHome));
}



class MyApp extends StatelessWidget {
 
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super (key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome ? HomePage() : OnBoardingScreen(),
    );
  }
}