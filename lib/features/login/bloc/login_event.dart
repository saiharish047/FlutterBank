part of 'login_bloc.dart';

enum PossibleTextfields { email, password }

@immutable
class LoginEvent {}

class OnTextFieldChangeSubmitEvent extends LoginEvent {
  final String userEnteredText;
  final PossibleTextfields eventType;

  OnTextFieldChangeSubmitEvent({required this.eventType,required this.userEnteredText});
}

class OnLoginButtonPressEvent extends LoginEvent {}

class OnFingerPrintLoginClickEvent extends LoginEvent {}

class OnWrongCredentialInputEvent extends LoginEvent {
  final PossibleTextfields eventType;
  OnWrongCredentialInputEvent({required this.eventType});
}
