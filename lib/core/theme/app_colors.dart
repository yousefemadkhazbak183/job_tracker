import 'package:flutter/material.dart';

abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFF378ADD);

  // Background
  static const Color background = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Status — No Reply
  static const Color noReplyBackground = Color(0xFFFAEEDA);
  static const Color noReplyText = Color(0xFF633806);
  static const Color noReplyBorder = Color(0xFFBA7517);

  // Status — Accepted
  static const Color acceptedBackground = Color(0xFFEAF3DE);
  static const Color acceptedText = Color(0xFF27500A);

  // Status — Rejected
  static const Color rejectedBackground = Color(0xFFFCEBEB);
  static const Color rejectedText = Color(0xFF791F1F);

  // Stats Cards
  static const Color totalBackground = Color(0xFFE6F1FB);
  static const Color totalText = Color(0xFF0C447C);

  // Text
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF8E8E93);

  // Border
  static const Color border = Color(0xFFE0E0E0);
}
