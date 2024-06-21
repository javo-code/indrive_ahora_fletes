import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final BlocFormItem email;
  EmailChanged({required this.email});
}

class PasswordChanged extends LoginEvent {
  final BlocFormItem password;
  PasswordChanged({required this.password});
}

class FormSubmit extends LoginEvent {}
