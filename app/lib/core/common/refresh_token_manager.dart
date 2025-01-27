import 'dart:async';

import 'package:buzzup/core/dependency_provider/api_client.provider.dart';
import 'package:buzzup/core/dependency_provider/auth.provider.dart';
import 'package:buzzup/core/models/token.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/jwt_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final refreshTokenManagerProvider = Provider((ref) {
  final notifier = RefreshTokenManager(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});
final userIsAuthProvider = StreamProvider.autoDispose<AuthStatus>((ref) async* {
  final refreshTokenManager = ref.watch(refreshTokenManagerProvider);
  yield* refreshTokenManager.authStatusStream;
});

class RefreshTokenManager {
  RefreshTokenManager(this.ref) : _authStatusStreamController = StreamController<AuthStatus>.broadcast();
  final Ref ref;
  final StreamController<AuthStatus> _authStatusStreamController;
  Timer? _refreshTimer;
  Stream<AuthStatus> get authStatusStream => _authStatusStreamController.stream;

  void _startTokenTimer(String accessToken) {
    _refreshTimer?.cancel();
    final expiryDate = JwtHelper.getExpiryDate(accessToken);

    if (expiryDate != null) {
      final duration = expiryDate.subtract(JwtHelper.substractDurationValuefFromExpiryDate).difference(DateTime.now());
      _refreshTimer = Timer(duration, refreshToken);
    }
  }

  Future<void> refreshToken() async {
    final getToken = await ref.read(tokenProvider.future);
    final getRefreshToken = await ref.read(refreshTokenProvider.future);
    if (getToken != null && getRefreshToken != null) {
      final refreshTokenUseCase = await ref.read(refreshTokenUsecaseProvider.future);
      final result = await refreshTokenUseCase();
      if (JwtHelper.isExpired(getRefreshToken)) {
        _authStatusStreamController.add(AuthStatus.unauthenticated);
      } else if (result case Right(value: Token(:final token))) {
        _startTokenTimer(token);
        _authStatusStreamController.add(AuthStatus.authenticated);
      } else if (result is Left) {
        _authStatusStreamController.add(AuthStatus.unauthenticated);
      } else {
        _authStatusStreamController.add(AuthStatus.unauthenticated);
      }
    } else {
      _authStatusStreamController.add(AuthStatus.unauthenticated);
    }
  }

  void dispose() {
    _authStatusStreamController.close();
  }
}

enum AuthStatus {
  authenticated,
  unauthenticated,
}
