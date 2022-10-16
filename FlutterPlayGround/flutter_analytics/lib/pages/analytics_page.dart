import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../infra/constants/app_constants.dart';
import '../infra/custom_widgets/default_buttons.dart';

class AnalyticsPage extends StatefulWidget {
  final FirebaseAnalytics? analytics;

  const AnalyticsPage({super.key, this.analytics});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstants.primaryColor,
        title: const Text('Firebase Analytics'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainButtons(
                onPressed: _sendHello,
                'Send Hello',
              ),
              mainButtons(
                onPressed: _sendComment,
                'Send Comments',
              ),
              mainButtons(onPressed: _sendDictionary, 'Send Dictionary'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendHello() async {
    await widget.analytics?.logEvent(
      name: 'ButtonSayHelloClicked',
    );
    const snackBar = SnackBar(
      content: Text('Event ButtonSayHelloClicked sent'),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _sendComment() async {
    await widget.analytics?.logEvent(
      name: 'ButtonSendCommentsClicked',
      parameters: <String, String>{
        'comment': 'This is a comment',
      },
    );
    const snackBar = SnackBar(
      content: Text('Event ButtonSendCommentsClicked sent'),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _sendDictionary() async {
    await widget.analytics?.logEvent(
      name: 'ButtonSendDictionaryDataClicked',
      parameters: <String, dynamic>{
        'greeting': 'Hello there',
        'comment': 'Great, it works!',
      },
    );
    const snackBar = SnackBar(
      content: Text('Event ButtonSendDictionaryDataClicked sent'),
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
