import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/shimmer_loading.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/presentation/widgets/doughnut_chart_widget.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/presentation/widgets/gradient_stat_card.dart';
import 'package:techfis_asset_management_mobile/injection_container.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_drawer.dart';
import 'package:techfis_asset_management_mobile/core/presentation/widgets/app_state_display.dart';
import 'package:techfis_asset_management_mobile/core/utils/error_translator.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/presentation/widgets/recent_assignments_list.dart';

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

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'ACTIVE':
        return AppColors.active;
      case 'INACTIVE':
        return AppColors.inactive;
      case 'UNDER_MAINTENANCE':
      case 'MAINTENANCE':
        return AppColors.maintenance;
      case 'DISPOSED':
        return AppColors.disposed;
      case 'BROKEN':
        return AppColors.broken;
      default:
        return AppColors.info;
    }
  }

  String _formatCurrency(double value, String locale) {
    try {
      final format = NumberFormat.currency(
          symbol: locale == 'vi' ? 'đ' : '\$',
          locale: locale == 'vi' ? 'vi_VN' : 'en_US',
          decimalDigits: 0);
      return format.format(value);
    } catch (_) {
      final symbol = locale == 'vi' ? 'đ' : '\$';
      return '${value.toStringAsFixed(0)} $symbol';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(l10n.dashboard),
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
              return const SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: ShimmerLoading(
                  child: Column(
                    children: [
                      ShimmerPlaceholder(
                          width: 120,
                          height: 28,
                          margin: EdgeInsets.only(bottom: 16)),
                      DashboardStatShimmer(),
                      SizedBox(height: 24),
                      DashboardChartShimmer(),
                      SizedBox(height: 24),
                      DashboardChartShimmer(),
                    ],
                  ),
                ),
              );
            } else if (state is DashboardError) {
              return AppStateDisplay.error(
                title: l10n.serverError,
                description: context.translateError(state.message),
                buttonLabel: l10n.retry,
                onButtonPressed: () {
                  context.read<DashboardBloc>().add(DashboardLoadRequested());
                },
              );
            } else if (state is DashboardLoaded) {
              final data = state.data;
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.overview,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 16),

                    // Main Stats Grid (2x2)
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.0,
                      children: [
                        GradientStatCard(
                          title: l10n.totalAssets,
                          value: data.summary.totalAssets.toString(),
                          icon: Icons.inventory_2,
                          gradientColors: AppColors.blueGradient,
                          subtitle:
                              '${data.summary.activeAssets} ${l10n.active}',
                        ),
                        GradientStatCard(
                          title: l10n.totalValue,
                          value: _formatCurrency(
                              data.summary.totalAssetValue, locale),
                          icon: Icons.attach_money,
                          gradientColors: AppColors.greenGradient,
                        ),
                        GradientStatCard(
                          title: l10n.maintenance,
                          value: _formatCurrency(
                              data.summary.totalMaintenanceCost, locale),
                          icon: Icons.build,
                          gradientColors: AppColors.orangeGradient,
                        ),
                        GradientStatCard(
                          title: l10n.users,
                          value: data.summary.userCount.toString(),
                          icon: Icons.people,
                          gradientColors: AppColors.purpleGradient,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Asset Status Section
                    _SectionHeader(title: l10n.assetStatus),
                    const SizedBox(height: 12),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DoughnutChartWidget(
                          data: data.assetsByStatus
                              .map((e) => DoughnutChartData(
                                    e.status,
                                    e.count.toDouble(),
                                    _getStatusColor(e.status),
                                  ))
                              .toList(),
                          centerText: data.summary.totalAssets.toString(),
                          centerLabel: l10n.assets,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Assignments Section
                    _SectionHeader(
                      title: l10n.assignments,
                      action: TextButton(
                        onPressed: () {},
                        child: Text(l10n.viewAll),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            DoughnutChartWidget(
                              data: [
                                DoughnutChartData(
                                    l10n.accepted,
                                    data.assignmentMetrics.totalAccepted
                                        .toDouble(),
                                    AppColors.success),
                                DoughnutChartData(
                                    l10n.pending,
                                    data.assignmentMetrics.totalPending
                                        .toDouble(),
                                    AppColors.warning),
                                DoughnutChartData(
                                    l10n.rejected,
                                    data.assignmentMetrics.totalRejected
                                        .toDouble(),
                                    AppColors.error),
                              ],
                              centerText:
                                  data.assignmentMetrics.total.toString(),
                              centerLabel: l10n.total,
                            ),
                            const Divider(height: 32),
                            RecentAssignmentsList(
                                assignments: data.recentAssignments),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Maintenance Section
                    _SectionHeader(title: l10n.maintenanceStatus),
                    const SizedBox(height: 12),
                    Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DoughnutChartWidget(
                              data: [
                                DoughnutChartData(
                                    l10n.completed,
                                    data.maintenanceMetrics.totalCompleted
                                        .toDouble(),
                                    AppColors.success),
                                DoughnutChartData(
                                    l10n.inProgress,
                                    data.maintenanceMetrics.totalInProgress
                                        .toDouble(),
                                    AppColors.info),
                                DoughnutChartData(
                                    l10n.scheduled,
                                    data.maintenanceMetrics.totalScheduled
                                        .toDouble(),
                                    AppColors.warning),
                                DoughnutChartData(
                                    l10n.failed,
                                    data.maintenanceMetrics.totalFailed
                                        .toDouble(),
                                    AppColors.error),
                              ],
                              centerText:
                                  data.maintenanceMetrics.total.toString(),
                              centerLabel: l10n.tasks,
                            ))),

                    const SizedBox(height: 24),

                    // Invoices Section
                    _SectionHeader(title: l10n.invoiceStatus),
                    const SizedBox(height: 12),
                    Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DoughnutChartWidget(
                              data: [
                                DoughnutChartData(
                                    l10n.paid,
                                    data.invoiceMetrics.totalPaid.toDouble(),
                                    AppColors.success),
                                DoughnutChartData(
                                    l10n.pending,
                                    data.invoiceMetrics.totalPending.toDouble(),
                                    AppColors.warning),
                                DoughnutChartData(
                                    l10n.overdue,
                                    data.invoiceMetrics.totalOverdue.toDouble(),
                                    AppColors.error),
                                DoughnutChartData(
                                    l10n.draft,
                                    data.invoiceMetrics.totalDraft.toDouble(),
                                    AppColors.disposed),
                              ],
                              centerText: data.invoiceMetrics.total.toString(),
                              centerLabel: l10n.invoices,
                            ))),
                    const SizedBox(height: 32),
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
