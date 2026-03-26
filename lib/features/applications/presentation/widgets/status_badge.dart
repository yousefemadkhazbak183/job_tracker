import 'package:flutter/material.dart';
import 'package:job_tracker/core/enums/application_status.dart';
import 'package:job_tracker/core/theme/app_colors.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});
  final ApplicationStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, background, textColor) = switch (status) {
      ApplicationStatus.noReply => (
        'No Reply',
        AppColors.noReplyBackground,
        AppColors.noReplyText,
      ),
      ApplicationStatus.accepted => (
        'Accepted',
        AppColors.acceptedBackground,
        AppColors.acceptedText,
      ),
      ApplicationStatus.rejected => (
        'Rejected',
        AppColors.rejectedBackground,
        AppColors.rejectedText,
      ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
