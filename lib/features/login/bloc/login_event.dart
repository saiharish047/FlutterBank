part of 'login_bloc.dart';

@immutable
class LoginEvent {}

class OnEmailSubmitEvent extends LoginEvent{}

class OnLoginButtonPressEvent extends LoginEvent{}

class OnFingerPrintLoginClickEvent extends LoginEvent{}

class OnWrongCredentialInputEvent extends LoginEvent{}

