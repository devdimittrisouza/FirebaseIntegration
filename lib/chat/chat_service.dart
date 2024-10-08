import 'package:push_notification/chat/chat_mock_service.dart';
import 'package:push_notification/core/models/chat_message.dart';
import 'package:push_notification/core/models/chat_user.dart';

abstract class ChatService {

  Stream<List<ChatMessage>> messageStream();
  Future<ChatMessage> save(String text, ChatUser user);

  factory ChatService(){
    return ChatMockService();
  }
}