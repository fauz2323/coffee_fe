import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helper/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Identify Coffee Beans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 252, 242, 240),
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 252, 242, 240))),
      initialRoute: '/',
      routes: RouteHelper.routes,
    );
  }
}
