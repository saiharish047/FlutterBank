part of 'login_bloc.dart';

enum ErrorType { wrongEmailFormat, emptyEmail, emptyPassword, noError }

@immutable
class LoginState {
  final ErrorType? errorType;

  const LoginState({this.errorType});
}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {
  final ErrorType error;

  const LoginError({required this.error}) : super(errorType: error);
}

class LoginAPISuccess extends LoginState {}

class LoginAPILoading extends LoginState {}

class LoginAPIFailure extends LoginState {}
