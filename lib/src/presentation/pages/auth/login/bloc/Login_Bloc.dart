import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_Event.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/login/bloc/Login_State.dart';
import 'package:ahora_fletes/src/presentation/utils/bloc_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error:
              event.email.value.isEmpty ? "You must to write an email" : null,
        ),
        formKey: formKey,
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isEmpty
              ? "You must write the password to access"
              : event.password.value.length < 6
                  ? "Password must have 6 characters at least"
                  : null,
        ),
        formKey: formKey,
      ));
    });

    on<FormSubmit>((event, emit) {
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
    });
  }
}
