import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:techfis_asset_management_mobile/injection_container.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/stat_card.dart';
import '../widgets/asset_status_chart.dart';
import '../widgets/recent_assignments_list.dart';
import '../../../../core/config/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DashboardBloc>()..add(DashboardLoadRequested()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<DashboardBloc>().add(DashboardRefreshRequested());
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DashboardError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<DashboardBloc>()
                            .add(DashboardLoadRequested());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is DashboardLoaded) {
              final data = state.data;
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Section
                    Text(
                      'Overview',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),

                    // Main Stats Grid
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      children: [
                        StatCard(
                          label: 'Total Assets',
                          value: data.summary.totalAssets.toString(),
                          icon: Icons.inventory_2,
                          color: AppTheme.primaryColor,
                          onTap: () {}, // Navigate to Asset List
                        ),
                        StatCard(
                          label: 'Active',
                          value: data.summary.activeAssets.toString(),
                          icon: Icons.check_circle,
                          color: Colors.green,
                        ),
                        StatCard(
                          label: 'Inactive',
                          value: data.summary.inactiveAssets.toString(),
                          icon: Icons.cancel,
                          color: Colors.red,
                        ),
                        StatCard(
                          label: 'Users',
                          value: data.summary.userCount.toString(),
                          icon: Icons.people,
                          color: AppTheme.secondaryColor,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Asset Status Section
                    const _SectionHeader(title: 'Asset Status'),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: AssetStatusChart(data: data.assetsByStatus),
                    ),

                    const SizedBox(height: 24),

                    // Recent Assignments
                    _SectionHeader(
                      title: 'Recent Assignments',
                      action: TextButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: RecentAssignmentsList(
                          assignments: data.recentAssignments),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Widget? action;

  const _SectionHeader({required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (action != null) action!,
      ],
    );
  }
}
