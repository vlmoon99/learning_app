import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/theme/app_theme.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({
    super.key,
    this.leading,
    required this.titleText,
  });
  final Widget? leading;
  final String titleText;
  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return AppBar(
      toolbarHeight: 100,
      leading: leading,
      backgroundColor: colors.white,
      elevation: 0,
      title: Text(
        titleText,
        style: textStyles.headingMedium!.copyWith(color: colors.text500),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(375, 100);
}
