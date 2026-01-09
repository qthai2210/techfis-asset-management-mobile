import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_notifications.dart';

import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/login_cubit.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/models/username.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/models/password.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/widgets/login_particles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  void _onLoginPressed(LoginState loginState) {
    if (loginState.isValid) {
      context.read<AuthBloc>().add(
            AuthLoginRequested(
              username: loginState.username.value,
              password: loginState.password.value,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.go('/');
            AppNotifications.showSuccess(context, l10n.loginSuccessful);
          } else if (state is AuthError) {
            AppNotifications.showError(context, state.message);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Animated Gradient Background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.loginBgStart,
                      AppColors.loginBgMiddle,
                      AppColors.loginBgEnd,
                    ],
                  ),
                ),
              ),

              // Floating Particles
              const LoginParticles(),

              // Content
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Header Section
                      FadeInUp(
                        duration: const Duration(milliseconds: 600),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    Color(0xFFAFCA31)
                                  ], // Match accent
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.3),
                                    blurRadius: 40,
                                    offset: const Offset(0, 20),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.shield_outlined,
                                size: 40,
                                color: AppColors.textLight,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              l10n.adminPortal,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: AppColors.textLight,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              l10n.secureAccess,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.textLight
                                        .withValues(alpha: 0.7),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),

                      // Login Form Card
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 600),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                              ),
                              child: BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, loginState) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      // Username
                                      TextFormField(
                                        onChanged: (value) => context
                                            .read<LoginCubit>()
                                            .usernameChanged(value),
                                        style: const TextStyle(
                                            color: AppColors.textLight),
                                        decoration: _buildInputDecoration(
                                          l10n.username,
                                          Icons.person_outline,
                                          errorText: loginState.username.isPure
                                              ? null
                                              : loginState.username.error ==
                                                      UsernameValidationError
                                                          .empty
                                                  ? l10n.pleaseEnterUsername
                                                  : null,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      // Password
                                      TextFormField(
                                        onChanged: (value) => context
                                            .read<LoginCubit>()
                                            .passwordChanged(value),
                                        obscureText: !_isPasswordVisible,
                                        style: const TextStyle(
                                            color: AppColors.textLight),
                                        decoration: _buildInputDecoration(
                                          l10n.password,
                                          Icons.lock_outline,
                                          errorText: loginState.password.isPure
                                              ? null
                                              : loginState.password.error ==
                                                      PasswordValidationError
                                                          .empty
                                                  ? l10n.pleaseEnterPassword
                                                  : null,
                                        ).copyWith(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: AppColors.textLight
                                                  .withValues(alpha: 0.7),
                                              size: 20,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordVisible =
                                                    !_isPasswordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      // Remember Me
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
                                              fillColor: WidgetStateProperty
                                                  .resolveWith(
                                                (states) => states.contains(
                                                        WidgetState.selected)
                                                    ? AppColors.primary
                                                    : Colors.transparent,
                                              ),
                                              side: BorderSide(
                                                  color: AppColors.textLight
                                                      .withValues(alpha: 0.7)),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            l10n.rememberMe,
                                            style: TextStyle(
                                                color: AppColors.textLight
                                                    .withValues(alpha: 0.9)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),

                                      // Submit Button
                                      Container(
                                        height: 54,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              AppColors.primary,
                                              AppColors.accent
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.3),
                                              blurRadius: 20,
                                              offset: const Offset(0, 10),
                                            ),
                                          ],
                                        ),
                                        child: ElevatedButton(
                                          onPressed: (state is AuthLoading ||
                                                  !loginState.isValid)
                                              ? null
                                              : () =>
                                                  _onLoginPressed(loginState),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: state is AuthLoading
                                              ? const SizedBox(
                                                  height: 24,
                                                  width: 24,
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: AppColors
                                                              .textLight,
                                                          strokeWidth: 2),
                                                )
                                              : Text(
                                                  l10n.signInToAdmin,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.textLight,
                                                  ),
                                                ),
                                        ),
                                      ),

                                      // Demo Credentials
                                      const SizedBox(height: 24),
                                      _buildAlert(
                                        title: 'Demo Credentials',
                                        color: AppColors.primary,
                                        icon: '🔑',
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildCredentialRow(
                                                'Username', 'admin'),
                                            const SizedBox(height: 4),
                                            _buildCredentialRow(
                                                'Password', 'password'),
                                          ],
                                        ),
                                      ),

                                      // Security Notice
                                      const SizedBox(height: 16),
                                      _buildAlert(
                                        title: 'Security Notice',
                                        color: AppColors.warning,
                                        iconPath: Icons.warning_amber_rounded,
                                        content: const Text(
                                          'Admin access is restricted. All activities are logged and monitored.',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                      Text(
                        'Protected by enterprise-grade security • Encrypted connection',
                        style: TextStyle(
                            color: AppColors.textLight.withValues(alpha: 0.5),
                            fontSize: 10),
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

  InputDecoration _buildInputDecoration(String label, IconData icon,
      {String? errorText}) {
    return InputDecoration(
      labelText: label,
      errorText: errorText,
      errorStyle: const TextStyle(color: AppColors.error),
      prefixIcon: Icon(icon, color: AppColors.textLight.withValues(alpha: 0.7)),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.textLight.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF9333EA)), // Purple focus
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Widget _buildAlert({
    required String title,
    required Color color,
    String? icon,
    IconData? iconPath,
    required Widget content,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Text(icon, style: const TextStyle(fontSize: 16))
          else if (iconPath != null)
            Icon(iconPath, color: color, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCredentialRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 11, color: AppColors.textLight),
        children: [
          TextSpan(text: '$label: '),
          TextSpan(
            text: ' $value ',
            style: TextStyle(
              backgroundColor: Colors.black.withValues(alpha: 0.3),
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

// Simple FadeInUp Animation helper
class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const FadeInUp({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    super.key,
  });

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _offset =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: _offset.value * 100, // Move 20 pixels
            child: widget.child,
          ),
        );
      },
    );
  }
}
