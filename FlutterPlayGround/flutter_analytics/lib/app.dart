import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_analytics/infra/constants/app_constants.dart';
import 'package:flutter_analytics/pages/bloc_pattern_page.dart';
import 'package:flutter_analytics/pages/homepage_inherited.dart';
import 'pages/home_page.dart';
import 'pages/analytics_page.dart';
import 'pages/revenue_cat_page.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
final FirebaseAnalyticsObserver firebaseObserver =
    FirebaseAnalyticsObserver(analytics: analytics);
final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      navigatorObservers: [firebaseObserver, routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppConstants.homePageRoute: (context) => const HomePage(),
        AppConstants.analyticsPageRoute: (context) =>
            AnalyticsPage(analytics: analytics),
        AppConstants.revenueCatPageRoute: (context) => const RevenueCatPage(),
        AppConstants.homePageInheritedRoute: (context) =>
            const HomePageInherited(),
        AppConstants.blocPatternPageRoute: (context) => const BlocPatternPage()
      },
    );
  }
}
