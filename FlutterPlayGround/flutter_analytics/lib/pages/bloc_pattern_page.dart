import 'package:flutter/material.dart';

class BlocPatternPage extends StatefulWidget {
  const BlocPatternPage({super.key});

  @override
  State<BlocPatternPage> createState() => _BlocPatternPageState();
}

class _BlocPatternPageState extends State<BlocPatternPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Bloc Pattern Page'),
        ),
      ),
    );
  }
}
