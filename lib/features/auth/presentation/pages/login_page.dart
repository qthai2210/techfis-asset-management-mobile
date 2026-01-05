import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginForm();
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthLoginRequested(
              username: _usernameController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dark Theme colors for Login Page
    const primaryColor = Color(0xFF004831);
    const secondaryColor = Color(0xFFAFCA31);
    const bgColor1 = Color(0xFF1A1A2E);
    const bgColor2 = Color(0xFF3B1E54);
    const textColor = Colors.white;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.go('/');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful')),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Gradient Background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [bgColor1, bgColor2, bgColor1],
                  ),
                ),
              ),
              // Background Particles (Optional refinement, static for now)
              // Blur Effect
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Section
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [primaryColor, secondaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.3),
                              blurRadius: 40,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons
                              .verified_user_outlined, // Fallback for ShieldCheck
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Admin Portal',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Secure access for administrators',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: textColor.withOpacity(0.7),
                            ),
                      ),
                      const SizedBox(height: 48),

                      // Login Form Card
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Username
                                  TextFormField(
                                    controller: _usernameController,
                                    style: const TextStyle(color: textColor),
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: TextStyle(
                                          color: textColor.withOpacity(0.7)),
                                      prefixIcon: Icon(Icons.person_outline,
                                          color: textColor.withOpacity(0.7)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: textColor.withOpacity(0.2)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF9333EA)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    validator: (value) => value!.isEmpty
                                        ? 'Please enter username'
                                        : null,
                                  ),
                                  const SizedBox(height: 16),
                                  // Password
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: !_isPasswordVisible,
                                    style: const TextStyle(color: textColor),
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: textColor.withOpacity(0.7)),
                                      prefixIcon: Icon(Icons.lock_outline,
                                          color: textColor.withOpacity(0.7)),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: textColor.withOpacity(0.7),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: textColor.withOpacity(0.2)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF9333EA)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    validator: (value) => value!.isEmpty
                                        ? 'Please enter password'
                                        : null,
                                  ),
                                  const SizedBox(height: 16),

                                  // Checkbox
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Checkbox(
                                          value: _rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _rememberMe = value!;
                                            });
                                          },
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                            (states) => states.contains(
                                                    MaterialState.selected)
                                                ? const Color(0xFF9333EA)
                                                : Colors.transparent,
                                          ),
                                          side: BorderSide(
                                              color:
                                                  textColor.withOpacity(0.7)),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Keep me signed in',
                                        style: TextStyle(
                                            color: textColor.withOpacity(0.9)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),

                                  // Submit Button
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [primaryColor, secondaryColor],
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: primaryColor.withOpacity(0.3),
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(
                                      onPressed: state is AuthLoading
                                          ? null
                                          : _onLoginPressed,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: state is AuthLoading
                                          ? const SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 2),
                                            )
                                          : const Text(
                                              'Sign In to Admin',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  ),

                                  // Demo Info
                                  const SizedBox(height: 24),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.15),
                                      border: Border.all(
                                          color: primaryColor.withOpacity(0.3)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Demo Credentials',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                            children: [
                                              const TextSpan(
                                                  text: 'Username: '),
                                              TextSpan(
                                                text: ' admin ',
                                                style: TextStyle(
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.3),
                                                  fontFamily: 'monospace',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                            children: [
                                              const TextSpan(
                                                  text: 'Password: '),
                                              TextSpan(
                                                text: ' password ',
                                                style: TextStyle(
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.3),
                                                  fontFamily: 'monospace',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      Text(
                        'Protected by enterprise-grade security',
                        style: TextStyle(
                            color: textColor.withOpacity(0.5), fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
