import 'package:bank/features/core/extensions/object_extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String _emailID = '';
  String _password = '';

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<OnTextFieldChangeSubmitEvent>((event, emit) {
      switch (event.eventType) {
        case PossibleTextfields.email:
          final userEnteredText = event.userEnteredText.trim();
          final result = _validateEmailId(userEnteredText);
          if (result == ErrorType.noError) {
            _emailID = userEnteredText;
            emit(const LoginError(error: ErrorType.noError));
          } else {
            emit(LoginError(error: result));
          }
          break;
        case PossibleTextfields.password:
          final userEnteredText = event.userEnteredText.trim();
          final result = _validatePassword(userEnteredText);
          if (result == ErrorType.noError) {
            _password = userEnteredText;
            emit(const LoginError(error: ErrorType.noError));
          } else {
            emit(LoginError(error: result));
          }
          break;
      }
    });

    on<OnLoginButtonPressEvent>(
      (event, emit) {
        emit(LoginAPIFailure());
      },
    );

    on<OnWrongCredentialInputEvent>(((event, emit) {
      switch (event.eventType) {
        case PossibleTextfields.email:
        case PossibleTextfields.password:
      }
    }));
  }

  ErrorType _validateEmailId(String text) {
    if (text.trim().isEmptyOrNull) {
      return ErrorType.emptyEmail;
    } else if (!text.isEmail) {
      return ErrorType.wrongEmailFormat;
    }
    return ErrorType.noError;
  }

  ErrorType _validatePassword(String text) {
    if (text.trim().isEmptyOrNull) {
      return ErrorType.emptyPassword;
    }
    return ErrorType.noError;
  }
}
