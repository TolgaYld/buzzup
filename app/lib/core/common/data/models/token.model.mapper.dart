// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'token.model.dart';

class TokenModelMapper extends ClassMapperBase<TokenModel> {
  TokenModelMapper._();

  static TokenModelMapper? _instance;
  static TokenModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TokenModelMapper._());
      TokenEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TokenModel';

  static String _$token(TokenModel v) => v.token;
  static const Field<TokenModel, String> _f$token = Field('token', _$token);
  static String _$refreshToken(TokenModel v) => v.refreshToken;
  static const Field<TokenModel, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken);
  static String? _$firebaseAccessToken(TokenModel v) => v.firebaseAccessToken;
  static const Field<TokenModel, String> _f$firebaseAccessToken =
      Field('firebaseAccessToken', _$firebaseAccessToken);

  @override
  final MappableFields<TokenModel> fields = const {
    #token: _f$token,
    #refreshToken: _f$refreshToken,
    #firebaseAccessToken: _f$firebaseAccessToken,
  };

  static TokenModel _instantiate(DecodingData data) {
    return TokenModel(
        token: data.dec(_f$token),
        refreshToken: data.dec(_f$refreshToken),
        firebaseAccessToken: data.dec(_f$firebaseAccessToken));
  }

  @override
  final Function instantiate = _instantiate;

  static TokenModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenModel>(map);
  }

  static TokenModel fromJson(String json) {
    return ensureInitialized().decodeJson<TokenModel>(json);
  }
}

mixin TokenModelMappable {
  String toJson() {
    return TokenModelMapper.ensureInitialized()
        .encodeJson<TokenModel>(this as TokenModel);
  }

  Map<String, dynamic> toMap() {
    return TokenModelMapper.ensureInitialized()
        .encodeMap<TokenModel>(this as TokenModel);
  }

  TokenModelCopyWith<TokenModel, TokenModel, TokenModel> get copyWith =>
      _TokenModelCopyWithImpl(this as TokenModel, $identity, $identity);
  @override
  String toString() {
    return TokenModelMapper.ensureInitialized()
        .stringifyValue(this as TokenModel);
  }

  @override
  bool operator ==(Object other) {
    return TokenModelMapper.ensureInitialized()
        .equalsValue(this as TokenModel, other);
  }

  @override
  int get hashCode {
    return TokenModelMapper.ensureInitialized().hashValue(this as TokenModel);
  }
}

extension TokenModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TokenModel, $Out> {
  TokenModelCopyWith<$R, TokenModel, $Out> get $asTokenModel =>
      $base.as((v, t, t2) => _TokenModelCopyWithImpl(v, t, t2));
}

abstract class TokenModelCopyWith<$R, $In extends TokenModel, $Out>
    implements TokenEntityCopyWith<$R, $In, $Out> {
  @override
  $R call({String? token, String? refreshToken, String? firebaseAccessToken});
  TokenModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TokenModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TokenModel, $Out>
    implements TokenModelCopyWith<$R, TokenModel, $Out> {
  _TokenModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TokenModel> $mapper =
      TokenModelMapper.ensureInitialized();
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
  TokenModel $make(CopyWithData data) => TokenModel(
      token: data.get(#token, or: $value.token),
      refreshToken: data.get(#refreshToken, or: $value.refreshToken),
      firebaseAccessToken:
          data.get(#firebaseAccessToken, or: $value.firebaseAccessToken));

  @override
  TokenModelCopyWith<$R2, TokenModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TokenModelCopyWithImpl($value, $cast, t);
}
