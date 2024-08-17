import 'package:buzzup/src/application/auth/notifier/auth_mode.notifier.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth_mode.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authModeProvider = StateNotifierProvider<AuthModeNotifier, AuthModeState>(
  (ref) => AuthModeNotifier(),
);
