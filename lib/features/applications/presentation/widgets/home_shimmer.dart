import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:job_tracker/core/theme/app_colors.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.border,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats shimmer
            Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Cards shimmer
            ...List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
