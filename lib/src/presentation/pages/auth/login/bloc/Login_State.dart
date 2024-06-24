import "package:ahora_fletes/src/presentation/utils/bloc_form_item.dart";
import "package:equatable/equatable.dart";
import "package:flutter/material.dart";

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlocFormItem(error: "Write your email"),
    this.password = const BlocFormItem(error: "Write your password"),
    this.formKey,
  });

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    BlocFormItem? email,
    BlocFormItem? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
