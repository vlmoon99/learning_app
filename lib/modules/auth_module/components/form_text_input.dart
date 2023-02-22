import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/theme/app_theme.dart';

class FormTextInput extends StatelessWidget {
  const FormTextInput({
    super.key,
    required this.nameTextEditingController,
    required this.hintText,
    required this.validator,
    this.isSecure = false,
  });

  final TextEditingController nameTextEditingController;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isSecure;
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
        controller: nameTextEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: colors.text100,
          hintText: hintText,
          hintStyle: textStyles.bodyMedium!.copyWith(color: colors.text300),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: colors.text200,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: colors.text200,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: colors.text200,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: colors.text200,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
