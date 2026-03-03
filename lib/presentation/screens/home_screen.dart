import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:idea/presentation/widgets/custom_appbar.dart';
import 'package:idea/routing/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(logoAssetPath: 'assets/images/logo.png',
      onRegisterTap: (){
        context.push(AppRoutes.registerRoute);
      },
      onSignUpTap: (){
        context.push(AppRoutes.loginRoute);
      },
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!, New Idea?', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}