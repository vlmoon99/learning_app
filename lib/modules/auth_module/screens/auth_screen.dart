import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/theme/app_theme.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.white,
        elevation: 0,
        title: Text(
          'Login',
          style: textStyles.headingMedium!.copyWith(color: colors.text500),
        ),
        centerTitle: true,
      ),
      backgroundColor: colors.white,
      body: Column(
        children: [],
      ),
    );
  }
}
