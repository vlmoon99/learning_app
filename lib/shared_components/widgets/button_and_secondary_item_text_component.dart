import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/shared_components/widgets/debouncer_button.dart';
import 'package:learning_app/theme/app_theme.dart';

class ButtonAndSecondaryItemTextComponent extends StatelessWidget {
  const ButtonAndSecondaryItemTextComponent({
    super.key,
    required this.onPressedButton,
    required this.buttonText,
    required this.secondaryItemText,
    required this.onPressedSecondaryTextItem,
  });

  final VoidCallback onPressedButton;
  final VoidCallback onPressedSecondaryTextItem;

  final String buttonText;
  final String secondaryItemText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 24,
            right: 24,
          ),
          child: MainButton(
            onPressed: onPressedButton,
            buttonText: buttonText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 23),
          child: SecondaryItemText(
            onPressed: onPressedSecondaryTextItem,
            secondaryItemText: secondaryItemText,
          ),
        ),
      ],
    );
  }
}

class SecondaryItemText extends StatelessWidget {
  const SecondaryItemText({
    super.key,
    required this.onPressed,
    required this.secondaryItemText,
  });

  final VoidCallback onPressed;
  final String secondaryItemText;

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return InkWell(
      onTap: onPressed,
      child: Text(
        secondaryItemText,
        style: textStyles.bodyMedium!.copyWith(
          color: colors.primary500,
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return DebounceButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: colors.primary500, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: textStyles.bodyMedium!.copyWith(color: colors.white),
            )
          ],
        ),
      ),
    );
  }
}
