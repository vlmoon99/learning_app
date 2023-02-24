import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learning_app/assets/localizations.dart';
import 'package:learning_app/model/jhister_models.dart';
import 'package:learning_app/modules/auth_module/components/auth_app_bar_widget.dart';
import 'package:learning_app/modules/auth_module/components/form_text_input.dart';
import 'package:learning_app/modules/auth_module/logic/vm/auth_vm.dart';
import 'package:learning_app/routes/routes.dart';
import 'package:learning_app/shared_components/widgets/button_and_secondary_item_text_component.dart';
import 'package:learning_app/theme/app_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final vm = Modular.get<AuthVM>();

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final colors = theme.getTheme().extension<MyColors>()!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppAppBar(
        titleText: LocalizationsStrings.auth.signup.title.tr(),
      ),
      backgroundColor: colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                        validator: (value) => (value?.length ?? 0) < 1
                            ? LocalizationsStrings
                                .auth.signup.nameTextInputErrorText
                                .tr()
                            : null,
                        textEditingController: nameTextEditingController,
                        hintText: LocalizationsStrings
                            .auth.signup.nameTextInputHint
                            .tr(),
                      ),
                      FormTextInput(
                        validator: (value) =>
                            EmailValidator.validate(value ?? '')
                                ? null
                                : LocalizationsStrings
                                    .auth.signup.emailTextInputErrorText
                                    .tr(),
                        textEditingController: emailTextEditingController,
                        hintText: LocalizationsStrings
                            .auth.signup.emailTextInputHint
                            .tr(),
                      ),
                      FormTextInput(
                        validator: (value) => (value?.length ?? 0) < 6
                            ? LocalizationsStrings
                                .auth.signup.passwordTextInputErrorText
                                .tr()
                            : null,
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
                    final name = nameTextEditingController.text;
                    final email = emailTextEditingController.text;
                    final password = passwordTextEditingController.text;
                    final res = await vm.register(
                      JhipsterRegisterUser(
                          email: email, login: name, password: password),
                    );
                    if (res) {
                      Modular.to
                          .pushNamed(Routes.auth.getRoute(Routes.auth.login));
                    }

                    log("Response from the server $res");
                  } else {
                    log("Error");
                  }
                },
                onPressedSecondaryTextItem: () {
                  log("onPressedSecondaryTextItem");
                },
                buttonText: LocalizationsStrings.auth.signup.buttonText.tr(),
                secondaryItemText:
                    LocalizationsStrings.auth.signup.forgotPassword.tr(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SecondaryItemText(
                  onPressed: () {
                    Modular.to
                        .pushNamed(Routes.auth.getRoute(Routes.auth.login));
                  },
                  secondaryItemText:
                      LocalizationsStrings.auth.signup.loginSecondaryText.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
