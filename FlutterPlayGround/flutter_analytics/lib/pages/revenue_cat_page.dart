import 'package:flutter/material.dart';
import 'package:flutter_analytics/infra/constants/app_constants.dart';
import 'package:flutter_analytics/infra/custom_widgets/default_buttons.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../models/product_model.dart';
import 'paywall_page.dart';

class RevenueCatPage extends StatefulWidget {
  const RevenueCatPage({super.key});

  @override
  State<RevenueCatPage> createState() => _RevenueCatPageState();
}

class _RevenueCatPageState extends State<RevenueCatPage> {
  Future fetchProducts() async {
    final offerings = await Purchases.getOfferings();

    if (offerings.current == null) {
      const snackBar = SnackBar(
        content: Text('No products available'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final packages = offerings.current?.availablePackages;

      final products = packages!.map((e) {
        return SubscriptionProduct(
          id: e.offeringIdentifier,
          price: e.storeProduct.priceString,
          title: e.storeProduct.title,
          description: e.storeProduct.description,
        );
      }).toList();

      // display a show modal bottom sheet
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return PayWallPage(
            title: 'List of Products',
            packages: packages,
            onClickedPackage: (package) async {
              await Purchases.purchasePackage(package);

              if (!mounted) return;
              Navigator.pop(context);
            },
          );
        },
      );
      return products;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        centerTitle: true,
        title: const Text('RevenueCat'),
      ),
      body: SafeArea(
        child: Center(
          child: mainButtons(
            onPressed: fetchProducts,
            'Get Products from RevenueCat',
          ),
        ),
      ),
    );
  }
}
