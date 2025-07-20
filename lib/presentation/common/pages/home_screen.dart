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
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to the Home Screen")),
      body: Center(
        child: Column(
          
          children: [
            const Text("Choose your user Id"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushRoute(ChatDiscussionRoute(userId: "userA", userName: "John Doe"));
              },
              child: const Text("User A"),
            ),
            const SizedBox(height: 20),
             ElevatedButton(
              onPressed: () {
                context.pushRoute(ChatDiscussionRoute(userId: "userB", userName: "Philippe Smith"));
              },
              child: const Text("User B"),
            ),
          ],
        )
      ),
    );
  }
}