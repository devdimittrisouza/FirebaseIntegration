import 'package:flutter/material.dart';
import 'package:push_notification/core/services/auth/auth_mock_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat page"),
            TextButton(
                onPressed: (){
                  AuthMockService().logout();
                },
                child: Text("Logout")
            )
          ],
        ),
      ),
    );
  }
}
