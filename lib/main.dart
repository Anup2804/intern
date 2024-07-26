import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_clone/provider/driver.provider.dart';
import 'package:taxi_clone/screens/home.user.dart';
import 'package:taxi_clone/screens/login.user.dart';
// import 'package:taxi_clone/screens/status.dart';
// import 'package:taxi_clone/widgets/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DriverProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
                bodyMedium: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                bodySmall: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14))),
        routes: {
          // "/": (context) => LoginUser(),
          "/":(context) => LoginUser(),
          "/home": (context) => HomeScreen(),
          // "/status": (context) => StatusScreen()
        },
      ),
    );
  }
}
