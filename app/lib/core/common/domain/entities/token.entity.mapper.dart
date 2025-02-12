// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'token.entity.dart';

class TokenEntityMapper extends ClassMapperBase<TokenEntity> {
  TokenEntityMapper._();

  static TokenEntityMapper? _instance;
  static TokenEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TokenEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TokenEntity';

  static String _$token(TokenEntity v) => v.token;
  static const Field<TokenEntity, String> _f$token = Field('token', _$token);
  static String _$refreshToken(TokenEntity v) => v.refreshToken;
  static const Field<TokenEntity, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken);
  static String? _$firebaseAccessToken(TokenEntity v) => v.firebaseAccessToken;
  static const Field<TokenEntity, String> _f$firebaseAccessToken =
      Field('firebaseAccessToken', _$firebaseAccessToken);

  @override
  final MappableFields<TokenEntity> fields = const {
    #token: _f$token,
    #refreshToken: _f$refreshToken,
    #firebaseAccessToken: _f$firebaseAccessToken,
  };

  static TokenEntity _instantiate(DecodingData data) {
    return TokenEntity(
        token: data.dec(_f$token),
        refreshToken: data.dec(_f$refreshToken),
        firebaseAccessToken: data.dec(_f$firebaseAccessToken));
  }

  @override
  final Function instantiate = _instantiate;

  static TokenEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenEntity>(map);
  }

  static TokenEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TokenEntity>(json);
  }
}

mixin TokenEntityMappable {
  String toJson() {
    return TokenEntityMapper.ensureInitialized()
        .encodeJson<TokenEntity>(this as TokenEntity);
  }

  Map<String, dynamic> toMap() {
    return TokenEntityMapper.ensureInitialized()
        .encodeMap<TokenEntity>(this as TokenEntity);
  }

  TokenEntityCopyWith<TokenEntity, TokenEntity, TokenEntity> get copyWith =>
      _TokenEntityCopyWithImpl(this as TokenEntity, $identity, $identity);
  @override
  String toString() {
    return TokenEntityMapper.ensureInitialized()
        .stringifyValue(this as TokenEntity);
  }

  @override
  bool operator ==(Object other) {
    return TokenEntityMapper.ensureInitialized()
        .equalsValue(this as TokenEntity, other);
  }

  @override
  int get hashCode {
    return TokenEntityMapper.ensureInitialized().hashValue(this as TokenEntity);
  }
}

extension TokenEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TokenEntity, $Out> {
  TokenEntityCopyWith<$R, TokenEntity, $Out> get $asTokenEntity =>
      $base.as((v, t, t2) => _TokenEntityCopyWithImpl(v, t, t2));
}

abstract class TokenEntityCopyWith<$R, $In extends TokenEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? token, String? refreshToken, String? firebaseAccessToken});
  TokenEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TokenEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TokenEntity, $Out>
    implements TokenEntityCopyWith<$R, TokenEntity, $Out> {
  _TokenEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TokenEntity> $mapper =
      TokenEntityMapper.ensureInitialized();
  @override
  $R call(
          {String? token,
          String? refreshToken,
          Object? firebaseAccessToken = $none}) =>
      $apply(FieldCopyWithData({
        if (token != null) #token: token,
        if (refreshToken != null) #refreshToken: refreshToken,
        if (firebaseAccessToken != $none)
          #firebaseAccessToken: firebaseAccessToken
      }));
  @override
  TokenEntity $make(CopyWithData data) => TokenEntity(
      token: data.get(#token, or: $value.token),
      refreshToken: data.get(#refreshToken, or: $value.refreshToken),
      firebaseAccessToken:
          data.get(#firebaseAccessToken, or: $value.firebaseAccessToken));

  @override
  TokenEntityCopyWith<$R2, TokenEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TokenEntityCopyWithImpl($value, $cast, t);
}
