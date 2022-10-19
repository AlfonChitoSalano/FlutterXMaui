import 'dart:ffi';

class SubscriptionProduct {
  final String id;
  final String? platformId;
  final Long? microsPrice;
  final String? currencyCode;
  final String title;
  final String price;
  final String description;

  SubscriptionProduct({
    required this.id,
    this.platformId,
    this.microsPrice,
    this.currencyCode,
    required this.title,
    required this.price,
    required this.description,
  });
}
