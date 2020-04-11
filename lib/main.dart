import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/helper/appColors.dart';
import 'package:task_manager/helper/generalStyles.dart';
import 'package:task_manager/helper/navigationservice.dart';
import 'package:task_manager/helper/routeManager.dart';
import 'package:task_manager/providers/homePageProvider.dart';
import 'pages/home/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: generalStyles.textStyleH3,
            bodyText2: generalStyles.textStyleH2,
          ).apply(
            bodyColor: AppColors().textColorLight,
            displayColor: Colors.blue,
          ),
        ),
        onGenerateRoute: RouteManager.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
        initialRoute: homeRoute,
        home: HomePage(),
      ),
    );
  }
}
