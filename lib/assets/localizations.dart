// ignore_for_file: library_private_types_in_public_api

class LocalizationsStrings {
  static final _Auth auth = _Auth();
  static final _Home home = _Home();
  static const localizationPath = './assets/translations';
}

class _Auth {
  final _Login login = _Login();
  final _SignUp signup = _SignUp();
}

class _Login {
  final title = "login.title";
  final buttonText = "login.buttonText";
  final forgotPassword = "login.forgotPassword";
}

class _SignUp {
  final title = "signup.title";
  final nameTextInputHint = "signup.nameTextInputHint";
  final emailTextInputHint = "signup.emailTextInputHint";
  final passwordTextInputHint = "signup.passwordTextInputHint";
  final nameTextInputErrorText = "signup.nameTextInputErrorText";
  final emailTextInputErrorText = "signup.emailTextInputErrorText";
  final passwordTextInputErrorText = "signup.passwordTextInputErrorText";
  final buttonText = "signup.buttonText";
  final forgotPassword = "signup.forgotPassword";
  final loginSecondaryText = "signup.loginSecondaryText";
}

class _Home {
  final helperOnTheHomePage = "helperOnTheHomePage";
  final helperOnTheCreateActivityPage = "helperOnTheCreateActivityPage";
}
