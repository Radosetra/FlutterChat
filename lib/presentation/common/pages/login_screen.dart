import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/presentation/common/pieces/mychat_input_widget.dart';
import 'package:my_chat/presentation/common/providers/auth_provider.dart';
import 'package:my_chat/styles/colors.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),

            // Logo and Title Section
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/logos/logo-without-text-bg.png",
                height: 50,
                width: 70,
              ),
            ),
            
            const SizedBox(height: 16.0),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: MyChatColors.primary
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              'Please login to your account',
              style: TextStyle(
                fontSize: 16.0,
                color: MyChatColors.gray,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 48.0),

            // Email Field
            Input(
              controller: _emailController,
              hint: "johndoe@gmail.com",
              label: "Email address",
              leading: const Icon(Icons.email_outlined, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),

            // Password Field
            Input(
              controller: _passwordController,
              label: "Password", 
              hint: "********",
              leading: const Icon(Icons.lock_outline, color: Colors.grey),
              trailing: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),

            const SizedBox(height: 16.0),

            // Remember Me and Forgot Password Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false, // You'll need state management for this
                      onChanged: (bool? value) {},
                      activeColor: Colors.black,
                    ),
                    const Text('Remember me'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            // Login Button
            ElevatedButton(
              onPressed: () {
              // Get the current values from the controllers
              final email = _emailController.text;
              final password = _passwordController.text;

              // Use ref.read to call the login method on your AuthNotifier
              ref.read(authProvider.notifier).login(email, password);
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyChatColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: authState.status == AuthStatus.loading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            const SizedBox(height: 24.0),

            // 'Or' Divider Section
            const Row(
              children: [
                Expanded(child: Divider(color: MyChatColors.gray)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Or', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider(color: MyChatColors.gray)),
              ],
            ),
            const SizedBox(height: 24.0),

            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account? "),
                TextButton(
                  onPressed: () {
                    // Navigate to sign-up screen
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyChatColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

