import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_app/assets/icons.dart';
import 'package:learning_app/assets/localizations.dart';
import 'package:learning_app/model/jhister_models.dart';
import 'package:learning_app/modules/auth_module/components/auth_app_bar_widget.dart';
import 'package:learning_app/modules/auth_module/components/form_text_input.dart';
import 'package:learning_app/modules/auth_module/logic/vm/auth_vm.dart';
import 'package:learning_app/routes/routes.dart';
import 'package:learning_app/shared_components/widgets/button_and_secondary_item_text_component.dart';
import 'package:learning_app/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailTextEditingController = TextEditingController();

  final passwordTextEditingController = TextEditingController();

  final vm = Modular.get<AuthVM>();

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final colors = theme.getTheme().extension<MyColors>()!;
    return Scaffold(
      appBar: AppAppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.arrowBackIcon,
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        titleText: LocalizationsStrings.auth.login.title.tr(),
      ),
      backgroundColor: colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    FormTextInput(
                      validator: (value) => null,

                      // validator: (value) => EmailValidator.validate(value ?? '')
                      // ? null
                      // : LocalizationsStrings
                      //     .auth.signup.emailTextInputErrorText
                      //     .tr(),
                      textEditingController: emailTextEditingController,
                      hintText: LocalizationsStrings
                          .auth.signup.emailTextInputHint
                          .tr(),
                    ),
                    FormTextInput(
                      validator: (value) => null,

                      // validator: (value) => (value?.length ?? 0) < 6
                      //     ? LocalizationsStrings
                      //         .auth.signup.passwordTextInputErrorText
                      //         .tr()
                      //     : null,
                      textEditingController: passwordTextEditingController,
                      hintText: LocalizationsStrings
                          .auth.signup.passwordTextInputHint
                          .tr(),
                      isSecure: true,
                    ),
                  ],
                ),
              ),
            ),
            ButtonAndSecondaryItemTextComponent(
              onPressedButton: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  log("Vse OK");
                  final userLogin = emailTextEditingController.text;
                  final password = passwordTextEditingController.text;
                  final res = await vm.login(JhipsterLoginUser(
                      password: password, userLogin: userLogin));
                  if (res) {
                    Modular.to.pushNamed(Routes.home.getModule());
                  }
                } else {
                  log("Error");
                }
              },
              onPressedSecondaryTextItem: () {
                log("onPressedSecondaryTextItem");
              },
              buttonText: LocalizationsStrings.auth.login.buttonText.tr(),
              secondaryItemText:
                  LocalizationsStrings.auth.login.forgotPassword.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
