import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_State.dart';
import 'package:ahora_fletes/src/presentation/pages/auth/register/bloc/Register_Event.dart';
import 'package:ahora_fletes/src/presentation/utils/Bloc_Form_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<FirstNameChanged>((event, emit) {
      emit(state.copyWith(
          firstName: BlocFormItem(
            value: event.firstName.value,
            error: event.firstName.value.isEmpty
                ? "You must write your firstname"
                : null,
          ),
          formKey: formKey));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(
          lastName: BlocFormItem(
            value: event.lastName.value,
            error: event.lastName.value.isEmpty
                ? "You must write your lastname"
                : null,
          ),
          formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty
                ? "You must write your email address"
                : null,
          ),
          formKey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isEmpty
                ? "You must write your phone number"
                : null,
          ),
          formKey: formKey));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isEmpty
                ? "You must write your password"
                : null,
          ),
          formKey: formKey));
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
        confirmPassword: BlocFormItem(
          value: event.confirmPassword.value,
          error: event.confirmPassword.value.isEmpty
              ? "You must write the password to access"
              : event.confirmPassword.value.length < 6
                  ? "Password must have 6 characters at least"
                  : event.confirmPassword.value != state.password.value
                      ? "The passwords doesn't match"
                      : null,
        ),
        formKey: formKey,
      ));
    });

    on<FormSubmit>((event, emit) {
      print("Firstname: ${state.firstName.value}");
      print("LastName: ${state.lastName.value}");
      print("Email: ${state.email.value}");
      print("Phone: ${state.phone.value}");
      print("Password: ${state.password.value}");
      print("ConfirmPassword: ${state.confirmPassword.value}");
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
