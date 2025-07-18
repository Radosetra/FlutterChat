import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/config/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to the Home Screen")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to BookDetailsScreen
            // context.pushRoute(BookDetailsRoute(id: 1));
            context.pushRoute(const ChatHomeRoute());
          },
          child: Text("Go to Chat"),
        ),
      ),
    );
  }
}