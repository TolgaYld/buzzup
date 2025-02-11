import 'package:buzzup/src/application/auth/notifier/auth.notifier.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
