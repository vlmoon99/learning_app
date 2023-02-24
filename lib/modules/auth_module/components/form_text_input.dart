import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/theme/app_theme.dart';

class FormTextInput extends StatelessWidget {
  FormTextInput(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.validator,
      this.isSecure = false,
      this.borderColor,
      this.borderRaduis = 8.0});

  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isSecure;
  Color? borderColor;
  final double borderRaduis;
  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        obscureText: isSecure,
        validator: validator,
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.text100,
          hintText: hintText,
          hintStyle: textStyles.bodyMedium!.copyWith(color: colors.text300),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRaduis),
            ),
            borderSide: BorderSide(
              color: borderColor ?? colors.text200,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRaduis),
            ),
            borderSide: BorderSide(
              color: borderColor ?? colors.text200,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRaduis),
            ),
            borderSide: BorderSide(
              color: borderColor ?? colors.text200,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRaduis),
            ),
            borderSide: BorderSide(
              color: borderColor ?? colors.text200,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
