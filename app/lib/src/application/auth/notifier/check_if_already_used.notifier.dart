import 'package:buzzup/core/dependency_provider/auth.provider.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/application/auth/workflow/state/check_if_already_used.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckIfAlreadyUsedNotifier
    extends StateNotifier<CheckIfAlreadyUsedState> {
  CheckIfAlreadyUsedNotifier(this.ref)
      : super(CheckIfAlreadyUsedState.initial());

  final Ref ref;

  Future<void> checkEmailIsAlreadyUsedHandler(String email) async {
    final usecase = await ref.watch(checkEmailExistsUsecaseProvider.future);
    final result = await usecase(email);
    switch (result) {
      case Left():
        state = state.copyWith(hasFailure: true);
        break;
      case Right(value: final isAlredyUsed):
        state = state.copyWith(emailIsAlreadyUsed: isAlredyUsed);
        break;
    }
  }

  Future<void> checkUsernameIsAlreadyUsedHandler(String username) async {
    final usecase = await ref.watch(checkUsernameExistsUsecaseProvider.future);
    final result = await usecase(username);

    switch (result) {
      case Left():
        state = state.copyWith(hasFailure: true);
        break;
      case Right(value: final isAlreadyUsed):
        state = state.copyWith(usernameIsAlreadyUsed: isAlreadyUsed);
        break;
    }
  }
}
