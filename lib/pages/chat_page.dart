import 'package:flutter/material.dart';
import 'package:push_notification/components/messages.dart';
import 'package:push_notification/components/new_message.dart';
import 'package:push_notification/core/services/auth/auth_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat",
        style: TextStyle(
          color: Colors.white
        )
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                              Icons.exit_to_app,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 10,
                          ),
                          Text("Sair")
                        ],
                      ),
                    )
                )
              ],
              onChanged: (value) {
                if(value == 'logout'){
                  AuthService().logout();
                }
              }
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Messages()
            ),
            NewMessage()
          ],
        ),
      ),
    );
  }
}
