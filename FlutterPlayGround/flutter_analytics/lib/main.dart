import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analytics/firebase_options.dart';
import 'package:flutter_analytics/infra/base/state_container.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'app.dart';
import 'infra/constants/app_constants.dart';

final _configuration = PurchasesConfiguration(AppConstants.apiKey);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Purchases.configure(_configuration);

  runApp(new StateContainer(child: const MyMaterialApp()));
}
