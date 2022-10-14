import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'infra/custom_widgets/default_button.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key, this.analytics});

  final FirebaseAnalytics? analytics;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Future<void> _sendHello() async {
    await widget.analytics?.logEvent(
      name: 'ButtonSayHelloClicked',
    );
    const SnackBar(
      content: Text('Event ButtonSayHelloClicked sent'),
    );
  }

  Future<void> _sendComment() async {
    await widget.analytics?.logEvent(
      name: 'ButtonSendCommentsClicked',
      parameters: <String, String>{
        'comment': 'This is a comment',
      },
    );
    const SnackBar(
      content: Text('Event ButtonSendCommentsClicked sent'),
    );
  }

  Future<void> _sendDictionary() async {
    await widget.analytics?.logEvent(
      name: 'ButtonSendDictionaryDataClicked',
      parameters: <String, dynamic>{
        'greeting': 'Hello there',
        'comment': 'Great, it works!',
      },
    );
    const SnackBar(
      content: Text('Event ButtonSendDictionaryDataClicked sent'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 96, 243),
        title: const Text('Firebase Analytics'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultButtonWidget(_sendHello, 'Send Hello'),
              defaultButtonWidget(_sendComment, 'Send Comments'),
              defaultButtonWidget(_sendDictionary, 'Send Dictionary'),
            ],
          ),
        ),
      ),
    );
  }
}
