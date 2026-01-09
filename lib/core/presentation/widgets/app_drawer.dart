import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_notifications.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/auth_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // Get user state for header
    final user = context.select((AuthBloc bloc) {
      final state = bloc.state;
      if (state is AuthAuthenticated) return state.user;
      return null;
    });

    return Drawer(
      child: Column(
        children: [
          // Premium Header
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 24,
              bottom: 24,
              left: 20,
              right: 20,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.accent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: AppColors.background,
                        child: Text(
                          (user?.fullName ?? 'A').substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'ADMIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  user?.fullName ?? 'Admin User',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user?.email ?? 'admin@example.com',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(
                  context,
                  title: l10n.overview,
                  icon: Icons.dashboard,
                  path: '/',
                ),
                _buildExpandableMenuItem(
                  context,
                  title: l10n.assetManagement,
                  icon: Icons.inventory_2,
                  children: [
                    _buildMenuItem(context,
                        title: l10n.assetList,
                        icon: Icons.list,
                        path: '/assets'),
                    _buildMenuItem(context,
                        title: l10n.importData,
                        icon: Icons.upload_file,
                        onTap: () => _showNotImplemented(context)),
                  ],
                ),
                _buildExpandableMenuItem(
                  context,
                  title: l10n.documentsAndRecords,
                  icon: Icons.description,
                  children: [
                    _buildMenuItem(context,
                        title: l10n.invoices,
                        icon: Icons.receipt,
                        onTap: () => _showNotImplemented(context)),
                    _buildMenuItem(context,
                        title: l10n.eDocuments,
                        icon: Icons.file_present,
                        onTap: () => _showNotImplemented(context)),
                  ],
                ),
                _buildExpandableMenuItem(
                  context,
                  title: l10n.trackingAndReports,
                  icon: Icons.analytics,
                  children: [
                    _buildMenuItem(context,
                        title: l10n.history,
                        icon: Icons.history,
                        onTap: () => _showNotImplemented(context)),
                    _buildMenuItem(context,
                        title: l10n.reports,
                        icon: Icons.summarize,
                        onTap: () => _showNotImplemented(context)),
                  ],
                ),
                _buildExpandableMenuItem(
                  context,
                  title: l10n.processAndOperations,
                  icon: Icons.work,
                  children: [
                    _buildMenuItem(context,
                        title: l10n.purchaseRequests,
                        icon: Icons.shopping_cart,
                        onTap: () => _showNotImplemented(context)),
                    _buildMenuItem(context,
                        title: l10n.approvals,
                        icon: Icons.check_circle,
                        onTap: () => _showNotImplemented(context)),
                  ],
                ),
                const Divider(),
                _buildExpandableMenuItem(
                  context,
                  title: l10n.system,
                  icon: Icons.settings,
                  children: [
                    _buildMenuItem(context,
                        title: l10n.buildingsAndLocations,
                        icon: Icons.business,
                        onTap: () => _showNotImplemented(context)),
                    _buildMenuItem(context,
                        title: l10n.departments,
                        icon: Icons.apartment,
                        onTap: () => _showNotImplemented(context)),
                    _buildMenuItem(context,
                        title: l10n.assetCategories,
                        icon: Icons.category,
                        onTap: () => _showNotImplemented(context)),
                    _buildMenuItem(context,
                        title: l10n.employees,
                        icon: Icons.people,
                        onTap: () => _showNotImplemented(context)),
                  ],
                ),
                const Divider(),
                _buildMenuItem(
                  context,
                  title: l10n.settings,
                  icon: Icons.settings_outlined,
                  path: '/settings',
                ),
              ],
            ),
          ),

          // Footer / Logout
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(l10n.logout, style: const TextStyle(color: Colors.red)),
            onTap: () {
              context.read<AuthBloc>().add(AuthLogoutRequested());
              context.go('/login');
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? path,
    VoidCallback? onTap,
  }) {
    // Check if active (simple path matching)
    final currentLocation = GoRouterState.of(context).uri.toString();
    final isActive = path != null && currentLocation == path;

    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.primary : null),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primary : null,
          fontWeight: isActive ? FontWeight.bold : null,
        ),
      ),
      selected: isActive,
      onTap: onTap ??
          () {
            if (path != null) {
              context.push(path); // Use push to keep back stack or go?
              // Standard drawer navigation usually replaces the stack or goes to root
              // But 'go' might be better for top-level items.
              context.go(path);
              Navigator.pop(context); // Close drawer
            }
          },
    );
  }

  Widget _buildExpandableMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(title),
      childrenPadding: const EdgeInsets.only(left: 16),
      children: children,
    );
  }

  void _showNotImplemented(BuildContext context) {
    Navigator.pop(context); // Close drawer
    AppNotifications.showInfo(
      context,
      AppLocalizations.of(context)!.featureComingSoon,
    );
  }
}
