import 'dart:io';

import 'package:flutter/material.dart';
import 'package:push_notification/components/user_image_picker.dart';
import 'package:push_notification/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({super.key,
  required this.onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePick(File image){
    _formData.image = image;
  }

  void _showError(String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg),
      backgroundColor: Theme.of(context).errorColor,
      )
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid) return;

    if(_formData.image == null && _formData.isSignUp){
      return _showError("Imagem não selecionada.");
    }

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if(_formData.isSignUp) UserImagePicker(onImagePick: _handleImagePick,),
              if(_formData.isSignUp)
                TextFormField(
                  key: ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (_name){
                    final name = _name ?? "";
                    if(name.trim().length < 5){
                      return "Nome deve ter no mínimo 5 caracteres.";
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (_email){
                  final email = _email ?? "";
                  if(!email.contains("@")){
                    return "O email informado não é válido.";
                  }
                  return null;
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                validator: (_password){
                  final password = _password ?? "";
                  if(password.length < 6){
                    return "A senha deve possuir no mínimo 6 caracteres.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(
                  _formData.isLogin ? "Entrar" : "Cadastrar",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                  child: Text(_formData.isLogin
                      ? "Criar uma nova conta?"
                      : "Já possui uma conta?"))
            ],
          ),
        ),
      ),
    );
  }
}
