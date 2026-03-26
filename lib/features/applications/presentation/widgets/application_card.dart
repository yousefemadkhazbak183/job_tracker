import 'package:flutter/material.dart';
import 'package:job_tracker/core/%20%20utils/date_formatter.dart';
import 'package:job_tracker/core/theme/app_colors.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/presentation/widgets/status_badge.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({
    super.key,
    required this.application,
    required this.onTap,
  });
  final JobApplication application;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  application.companyName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  DateFormatter.formatDate(application.appliedDate),
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            StatusBadge(status: application.status),
          ],
        ),
      ),
    );
  }
}
