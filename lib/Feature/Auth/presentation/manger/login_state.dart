part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginViewStateLoading extends LoginState{}
class LoginViewStateSuccess extends LoginState {
  final Customer dataUser;
  LoginViewStateSuccess(this.dataUser);
}

class LoginViewStateError extends LoginState{

  final String error;
  LoginViewStateError(this.error);
}