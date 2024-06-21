import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final BlocFormItem firstName;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;

  const RegisterState({
    this.firstName = const BlocFormItem(error: "write youer firstName"),
    this.lastName = const BlocFormItem(error: "write youer lastName"),
    this.email = const BlocFormItem(error: "write youer email"),
    this.phone = const BlocFormItem(error: "write youer phone"),
    this.password = const BlocFormItem(error: "write youer password"),
    this.confirmPassword =
        const BlocFormItem(error: "write youer confirmPassword"),
    this.formKey,
  });

  RegisterState copyWith({
    BlocFormItem? firstName,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
  }) {
    return RegisterState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        password,
        confirmPassword,
      ];
}
