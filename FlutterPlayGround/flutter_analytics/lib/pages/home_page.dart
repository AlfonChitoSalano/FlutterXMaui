import 'package:flutter/material.dart';
import 'package:flutter_analytics/infra/constants/app_constants.dart';
import 'package:flutter_analytics/infra/custom_widgets/default_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainButtons(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppConstants.analyticsPageRoute),
              'Navigate to Analytics',
            ),
            mainButtons(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppConstants.revenueCatPageRoute),
              'Navigate to RevenueCat',
            )
          ],
        ),
      ),
    );
  }
}
