import 'dart:ffi';

class SubscriptionProudct {
  final String id;
  final String? platformId;
  final Long? microsPrice;
  final String? currencyCode;
  final String title;
  final String price;
  final String description;

  SubscriptionProudct({
    required this.id,
    this.platformId,
    this.microsPrice,
    this.currencyCode,
    required this.title,
    required this.price,
    required this.description,
  });
}
