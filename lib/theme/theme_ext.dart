import 'package:flutter/material.dart';
import 'package:suraksha_sathi/theme/app_colors.dart';

extension ThemeExt on BuildContext {
  AppColors get appColors =>
      Theme.of(this).extension<AppColors>() ?? LightColor();
}
