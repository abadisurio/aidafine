part of 'user_bloc.dart';

class UserEvent {
  const UserEvent();
}

class UserInitialize extends UserEvent {
  const UserInitialize();
}

class SignInWithGoogle extends UserEvent {
  const SignInWithGoogle();
}

class SignInWithPassword extends UserEvent {
  const SignInWithPassword();
}

class RefreshOrbyteUser extends UserEvent {
  const RefreshOrbyteUser({this.newOrbyteUser});

  final Pilot? newOrbyteUser;
}

class SignOut extends UserEvent {
  const SignOut();
}
