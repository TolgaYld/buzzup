import 'dart:io';

import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/core/common/env/environment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Providers for External Dependencies
final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final tokenProvider = FutureProvider<String?>((ref) async {
  final storage = ref.read(flutterSecureStorageProvider);
  return await storage.read(key: kCachedTokenKey);
});

final refreshTokenProvider = FutureProvider<String?>((ref) async {
  final storage = ref.read(flutterSecureStorageProvider);
  return await storage.read(key: kCachedRefreshTokenKey);
});

final graphQLClientProvider = FutureProvider<GraphQLClient>((ref) async {
  final box = await HiveStore.openBox(kGraphqlHiveBoxName);
  final link = AuthLink(
    getToken: () async => "Bearer ${await ref.read(tokenProvider.future)}",
  ).concat(
    HttpLink(
      switch (Environment.type == EnvironmentType.test) {
        true => switch (Platform.isAndroid) {
            true => "http://10.0.2.2:8000/graphql",
            false => Environment.baseUrl,
          },
        false => Environment.baseUrl,
      },
      defaultHeaders: {
        "refresh": "Bearer ${await ref.read(refreshTokenProvider.future)}",
      },
    ),
  );

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore(box)),
  );
});
