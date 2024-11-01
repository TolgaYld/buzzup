import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

enum PasswordValidationError { empty, tooShort }

enum RepeatPasswordValidationError { empty, doesNotMatch }

enum UsernameValidationError { invalid, empty, spaces, tooShort }

class UsernameInput extends FormzInput<String, UsernameValidationError> {
  const UsernameInput.pure() : super.pure("");
  const UsernameInput.dirty([super.value = ""]) : super.dirty();

  static const _usernamePattern = r'^[\w](?!.*?\.{2})[\w.]{1,28}[\w]$';
  static final RegExp _usernameRegExp = RegExp(_usernamePattern);

  @override
  UsernameValidationError? validator(String value) {
    return switch (value) {
      final value when value.isEmpty => UsernameValidationError.empty,
      final value when value.length < 3 => UsernameValidationError.tooShort,
      final value when _usernameRegExp.hasMatch(value) == false => UsernameValidationError.invalid,
      final value when value.contains(" ") == true => UsernameValidationError.spaces,
      _ => null,
    };
  }
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure("");
  const EmailInput.dirty([super.value = ""]) : super.dirty();

  static const _emailPattern =
      r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''';
  static final _emailRegExp = RegExp(_emailPattern);

  @override
  EmailValidationError? validator(String value) {
    return switch (value.trim()) {
      final value when value.isEmpty => EmailValidationError.empty,
      final value when _emailRegExp.hasMatch(value) == false => EmailValidationError.invalid,
      _ => null,
    };
  }
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure("");
  const PasswordInput.dirty([super.value = ""]) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    return switch (value) {
      final value when value.isEmpty => PasswordValidationError.empty,
      final value when value.length < 8 => PasswordValidationError.tooShort,
      _ => null,
    };
  }
}

class RepeatPasswordInput extends FormzInput<String, RepeatPasswordValidationError> {
  const RepeatPasswordInput.dirty(this.password, [String value = ""]) : super.dirty(value);
  const RepeatPasswordInput.pure(this.password) : super.pure("");

  final String password;

  @override
  RepeatPasswordValidationError? validator(String value) {
    return switch (value) {
      final value when value.isEmpty => RepeatPasswordValidationError.empty,
      final value when value != password => RepeatPasswordValidationError.doesNotMatch,
      _ => null,
    };
  }
}
