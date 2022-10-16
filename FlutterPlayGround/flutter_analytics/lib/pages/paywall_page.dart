import 'package:flutter/material.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';

class PayWallPage extends StatefulWidget {
  final String title;
  final List<Package> packages;
  final ValueChanged<Package> onClickedPackage;

  const PayWallPage({
    required this.title,
    required this.packages,
    required this.onClickedPackage,
    super.key,
  });

  @override
  State<PayWallPage> createState() => _PayWallPageState();
}

class _PayWallPageState extends State<PayWallPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            buildPackages(),
          ],
        ),
      ),
    );
  }

  Widget buildPackages() => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.packages.length,
        itemBuilder: (context, index) {
          final package = widget.packages[index];

          return buildPackage(context, package);
        },
      );

  Widget buildPackage(BuildContext context, Package package) {
    final product = package.storeProduct;

    return Card(
      color: Colors.black,
      elevation: 0,
      margin: const EdgeInsets.fromLTRB(2, 10, 2, 10),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        textColor: Colors.white,
        contentPadding: const EdgeInsets.all(10),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Text(product.priceString),
        onTap: () => widget.onClickedPackage(package),
      ),
    );
  }
}
