import 'package:flutter/material.dart';
import '../../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 28),

            // Titre Holbegram
            const Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50,
              ),
            ),

            // Logo
            Image.asset(
              'assets/images/logo.png',
              width: 80,
              height: 60,
            ),

            const SizedBox(height: 28),

            // Padding général
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Email field
                  TextFieldInput(
                    controller: emailController,
                    isPassword: false,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 24),

                  // Password field
                  TextFieldInput(
                    controller: passwordController,
                    isPassword: !_passwordVisible,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Login button
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(218, 226, 37, 24),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Appeler login() plus tard
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Forgot your login details? '),
                      Text(
                        'Get help logging in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Divider(thickness: 2),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account "),
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(218, 226, 37, 24),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // OR separator
                  Row(
                    children: const [
                      Flexible(child: Divider(thickness: 2)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('OR'),
                      ),
                      Flexible(child: Divider(thickness: 2)),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Google sign in row
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text('Sign in with Google'),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
