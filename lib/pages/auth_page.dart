import 'package:flutter/material.dart';
import 'package:push_notification/components/auth_form.dart';
import 'package:push_notification/core/models/auth_form_data.dart';
import 'package:push_notification/core/services/auth/auth_mock_service.dart';
import 'package:push_notification/core/services/auth/auth_service.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {

    try{
      setState(() => _isLoading = true);

      if(formData.isLogin){
        //login
        await AuthService().login(formData.email, formData.password);
      }else {
        //signup
        await AuthMockService().signup(
            formData.name,
            formData.email,
            formData.password,
            formData.image
        );
      }
    }catch(error){

    } finally{
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit:_handleSubmit),
            ),
          ),
          if(_isLoading) Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5)
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
