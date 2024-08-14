import 'package:flutter/material.dart';
import 'package:push_notification/chat/chat_service.dart';
import 'package:push_notification/core/models/chat_message.dart';

class Messages extends StatelessWidget{
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messageStream(),
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(
              child: Text("Sem dados. Vamos converar?"),
            );
          }else {
            final msgs = snapshot.data!;
            return ListView.builder(
              reverse: true,
              itemCount: msgs.length,
                itemBuilder: (ctx, i) => Text(msgs[i].text)
            );
          }
        }
    );
  }
}
