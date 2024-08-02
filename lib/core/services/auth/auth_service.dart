import 'dart:io';

import 'package:push_notification/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Future<void> signup(
    String name,
    String email,
    String senha,
    File image,
  );
  Future<void> login(
    String email,
    String password,
  );
  Future<void> logout();
}
