import 'package:dart_mappable/dart_mappable.dart';

part 'check_if_already_used.state.mapper.dart';

@MappableClass()
class CheckIfAlreadyUsedState with CheckIfAlreadyUsedStateMappable {
  const CheckIfAlreadyUsedState({
    required this.emailIsAlreadyUsed,
    required this.usernameIsAlreadyUsed,
    required this.hasFailure,
  });

  factory CheckIfAlreadyUsedState.initial() => const CheckIfAlreadyUsedState(
        emailIsAlreadyUsed: false,
        usernameIsAlreadyUsed: false,
        hasFailure: false,
      );

  final bool emailIsAlreadyUsed;
  final bool usernameIsAlreadyUsed;
  final bool hasFailure;
}
