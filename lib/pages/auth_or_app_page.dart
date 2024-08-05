import 'package:flutter/material.dart';
import 'package:push_notification/core/models/chat_user.dart';
import 'package:push_notification/core/services/auth/auth_mock_service.dart';
import 'package:push_notification/pages/auth_page.dart';
import 'package:push_notification/pages/chat_page.dart';
import 'package:push_notification/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingPage();
          }else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
        stream: AuthMockService().userChanges,
      )
    );
  }
}
