import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class FirstNameChanged extends RegisterInitEvent {
  final BlocFormItem firstName;
  FirstNameChanged({required this.firstName});
}

class LastNameChanged extends RegisterInitEvent {
  final BlocFormItem lastName;
  LastNameChanged({required this.lastName});
}

class EmailChanged extends RegisterInitEvent {
  final BlocFormItem email;
  EmailChanged({required this.email});
}

class PhoneChanged extends RegisterInitEvent {
  final BlocFormItem phone;
  PhoneChanged({required this.phone});
}

class PasswordChanged extends RegisterInitEvent {
  final BlocFormItem password;
  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterInitEvent {
  final BlocFormItem confirmPassword;
  ConfirmPasswordChanged({required this.confirmPassword});
}

class FormSubmit extends RegisterInitEvent {}

class FormReset extends RegisterInitEvent {}
