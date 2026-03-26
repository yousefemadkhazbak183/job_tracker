import 'package:flutter/material.dart';
import 'package:job_tracker/core/enums/application_status.dart';
import 'package:job_tracker/core/theme/app_colors.dart';
import 'package:job_tracker/features/applications/domain/entities/job_application.dart';
import 'package:job_tracker/features/applications/presentation/widgets/stat_card.dart';

class CardState extends StatelessWidget {
  const CardState({super.key, required this.applications});

  final List<JobApplication> applications;

  @override
  Widget build(BuildContext context) {
    final total = applications.length;
    final noReply = applications
        .where((e) => e.status == ApplicationStatus.noReply)
        .length;
    final accepted = applications
        .where((e) => e.status == ApplicationStatus.accepted)
        .length;
    final rejected = applications
        .where((e) => e.status == ApplicationStatus.rejected)
        .length;
    return Row(
      children: [
        StatCard(
          label: 'Total',
          count: total,
          background: AppColors.totalBackground,
          textColor: AppColors.totalText,
        ),
        SizedBox(width: 8),
        StatCard(
          label: 'No Reply',
          count: noReply,
          background: AppColors.noReplyBackground,
          textColor: AppColors.noReplyText,
        ),
        SizedBox(width: 8),
        StatCard(
          label: 'Accepted',
          count: accepted,
          background: AppColors.acceptedBackground,
          textColor: AppColors.acceptedText,
        ),
        SizedBox(width: 8),
        StatCard(
          label: 'Rejected',
          count: rejected,
          background: AppColors.rejectedBackground,
          textColor: AppColors.rejectedText,
        ),
      ],
    );
  }
}
