import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_chat/styles/colors.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),

            // Logo and Title Section
            Image.asset(
              "assets/logos/Logo_MyChat_Horizental.png",
              height: 50,
              width: 70,
            ),
            // SvgPicture.asset(
            //   "assets/logos/Logo-MyChat-Horizental.svg",
            //   // height: 40,
            //   // width: 70,
            // ),
            const SizedBox(height: 16.0),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
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
            TextFormField(
              decoration: InputDecoration(
                hintText: 'alina.solvaeica@gmail.com',
                labelText: 'E-mail Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),

            // Password Field
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '********',
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off, color: Colors.grey),
                  onPressed: () {
                    // Toggle password visibility
                  },
                ),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MyChatColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
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
            const SizedBox(height: 48.0),

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