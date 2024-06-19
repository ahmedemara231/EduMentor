class AuthStates {}

class ChangePassVisibility extends AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {}

class AuthError extends AuthStates {
  String? message;
  AuthError(this.message);
}
