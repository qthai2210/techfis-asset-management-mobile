import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:techfis_asset_management_mobile/features/settings/presentation/bloc/language_bloc.dart';
import 'package:techfis_asset_management_mobile/features/settings/presentation/bloc/theme_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = context.select((AuthBloc bloc) {
      final state = bloc.state;
      if (state is AuthAuthenticated) return state.user;
      return null;
    });

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.settings),
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            _buildProfileCard(context, user, l10n),
            const SizedBox(height: 24),

            // Appearance Section
            _SectionHeader(title: l10n.appearance),
            const SizedBox(height: 12),
            _buildSettingsCard(
              context: context,
              children: [
                _buildThemeToggle(context, l10n),
                Divider(height: 1, color: Theme.of(context).dividerTheme.color),
                _buildLanguageSelector(context, l10n),
              ],
            ),
            const SizedBox(height: 24),

            // Notifications Section
            _SectionHeader(title: l10n.notifications),
            const SizedBox(height: 12),
            _buildSettingsCard(
              context: context,
              children: [
                _buildSettingTile(
                  context: context,
                  icon: Icons.notifications_outlined,
                  title: l10n.notificationSettings,
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Account Section
            _SectionHeader(title: l10n.account),
            const SizedBox(height: 12),
            _buildSettingsCard(
              context: context,
              children: [
                _buildSettingTile(
                  context: context,
                  icon: Icons.logout,
                  title: l10n.logout,
                  textColor: Theme.of(context).colorScheme.error,
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogoutRequested());
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(
      BuildContext context, dynamic user, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Card(
      elevation: 0,
      color: theme.cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: theme.dividerTheme.color?.withValues(alpha: 0.5) ??
                Colors.transparent),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: colorScheme.primary.withValues(alpha: 0.2),
              child: Text(
                (user?.fullName ?? 'A').substring(0, 1).toUpperCase(),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.fullName ?? 'Admin User',
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? 'admin@example.com',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(l10n.editProfile,
                        style: const TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
      {required BuildContext context, required List<Widget> children}) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      color: theme.cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
            color: theme.dividerTheme.color?.withValues(alpha: 0.5) ??
                Colors.transparent),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final effectiveTextColor = textColor ?? theme.textTheme.bodyLarge?.color;
    final effectiveIconColor = textColor ?? colorScheme.primary;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: effectiveIconColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: effectiveIconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: effectiveTextColor,
        ),
      ),
      trailing: trailing ??
          Icon(Icons.chevron_right,
              size: 20, color: theme.textTheme.bodySmall?.color),
      onTap: onTap,
    );
  }

  Widget _buildThemeToggle(BuildContext context, AppLocalizations l10n) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;
        final colorScheme = Theme.of(context).colorScheme;
        return _buildSettingTile(
          context: context,
          icon: isDark ? Icons.dark_mode : Icons.light_mode,
          title: l10n.darkMode,
          trailing: Switch(
            value: isDark,
            onChanged: (value) {
              context.read<ThemeBloc>().add(
                    ThemeEvent.changed(
                        value ? ThemeMode.dark : ThemeMode.light),
                  );
            },
            activeColor: colorScheme.primary,
            activeTrackColor: colorScheme.primary.withValues(alpha: 0.3),
            inactiveThumbColor: colorScheme.onSurface.withValues(alpha: 0.6),
            inactiveTrackColor: colorScheme.surfaceContainerHighest,
          ),
        );
      },
    );
  }

  Widget _buildLanguageSelector(BuildContext context, AppLocalizations l10n) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return _buildSettingTile(
          context: context,
          icon: Icons.language,
          title: l10n.language,
          trailing: DropdownButton<String>(
            value: state.locale.languageCode,
            dropdownColor: Theme.of(context).cardTheme.color,
            style: Theme.of(context).textTheme.bodyMedium,
            underline: const SizedBox(),
            icon: Icon(Icons.keyboard_arrow_down,
                size: 20, color: Theme.of(context).iconTheme.color),
            onChanged: (String? newValue) {
              if (newValue != null) {
                context.read<LanguageBloc>().add(LanguageChanged(newValue));
              }
            },
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'vi', child: Text('Tiếng Việt')),
              DropdownMenuItem(value: 'ja', child: Text('日本語')),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodySmall?.color,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
