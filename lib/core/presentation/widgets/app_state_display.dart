import 'package:flutter/material.dart';
import 'package:techfis_asset_management_mobile/core/constants/app_colors.dart';

enum AppStateDisplayType { empty, error, info }

class AppStateDisplay extends StatelessWidget {
  final AppStateDisplayType type;
  final String title;
  final String description;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;
  final IconData? customIcon;

  const AppStateDisplay({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    this.buttonLabel,
    this.onButtonPressed,
    this.customIcon,
  });

  factory AppStateDisplay.empty({
    required String title,
    required String description,
    String? buttonLabel,
    VoidCallback? onButtonPressed,
    IconData? customIcon,
  }) =>
      AppStateDisplay(
        type: AppStateDisplayType.empty,
        title: title,
        description: description,
        buttonLabel: buttonLabel,
        onButtonPressed: onButtonPressed,
        customIcon: customIcon ?? Icons.search_off_outlined,
      );

  factory AppStateDisplay.error({
    required String title,
    required String description,
    required String buttonLabel,
    required VoidCallback onButtonPressed,
    IconData? customIcon,
  }) =>
      AppStateDisplay(
        type: AppStateDisplayType.error,
        title: title,
        description: description,
        buttonLabel: buttonLabel,
        onButtonPressed: onButtonPressed,
        customIcon: customIcon ?? Icons.error_outline_rounded,
      );

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = _getPrimaryColor();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration / Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer ring
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor.withValues(alpha: 0.2),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Inner shadow/glow
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    customIcon,
                    size: 50,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Text Content
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 32),
            // Action Button
            if (buttonLabel != null && onButtonPressed != null)
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: type == AppStateDisplayType.error
                      ? AppColors.error
                      : AppColors.primary,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  buttonLabel!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getPrimaryColor() {
    switch (type) {
      case AppStateDisplayType.empty:
        return AppColors.textSecondary;
      case AppStateDisplayType.error:
        return AppColors.error;
      case AppStateDisplayType.info:
        return AppColors.info;
    }
  }
}
