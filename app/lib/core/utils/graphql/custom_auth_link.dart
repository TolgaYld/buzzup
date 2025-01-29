import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/core/common/env/environment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:buzzup/core/dependency_provider/api_client.provider.dart';

class CustomAuthLink extends Link {
  const CustomAuthLink(this.ref);
  final Ref ref;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final token = await ref.read(tokenProvider.future);
    final refreshToken = await ref.read(refreshTokenProvider.future);

    final updatedRequest = request.updateContextEntry<HttpLinkHeaders>(
      (headers) => HttpLinkHeaders(
        headers: {
          ...?headers?.headers,
          if (token != null) 'Authorization': 'Bearer $token',
          if (refreshToken != null) 'refresh': 'Bearer $refreshToken',
        },
      ),
    );
    if (forward != null) {
      yield* forward(updatedRequest);
    }
  }
}
