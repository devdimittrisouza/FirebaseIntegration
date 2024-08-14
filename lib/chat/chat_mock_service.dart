import 'dart:js_interop';
import 'dart:math';

import 'package:push_notification/chat/chat_service.dart';
import 'package:push_notification/core/models/chat_message.dart';
import 'dart:async';

import 'package:push_notification/core/models/chat_user.dart';


class ChatMockService implements ChatService {

  static final List<ChatMessage> _msgs = [
    ChatMessage(
        id: '1',
        text: 'Bom dia.',
        createAt: DateTime.now(),
        userId: '123',
        userName: 'Usuário 1',
        userImageURL: 'assets/imagens/avatar.png '
    ),
    ChatMessage(
        id: '2',
        text: 'Bom dia, teremos reunião hoje?',
        createAt: DateTime.now(),
        userId: '789',
        userName: 'Usuário 2',
        userImageURL: 'assets/imagens/avatar.png '
    ),
    ChatMessage(
        id: '1',
        text: 'Sim, pode ser agora.',
        createAt: DateTime.now(),
        userId: '123',
        userName: 'Usuário 1',
        userImageURL: 'assets/imagens/avatar.png '
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
  });

  Stream<List<ChatMessage>> messageStream(){
    return _msgsStream;
}
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
        id: Random().nextDouble().toString(),
        text: text,
        createAt: DateTime.now(),
        userId: user.id,
        userName: user.name,
        userImageURL: user.imageURL
      );
    _msgs.add(newMessage);
    _controller?.add(_msgs);
    return newMessage;
  }

}