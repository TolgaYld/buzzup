import 'localizations.dart';

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get language => 'Türkçe';

  @override
  String get username => 'Kullanıcı adın';

  @override
  String get email_or_username => 'E-Posta yada kullanıcı adı';

  @override
  String get email_adress => 'E-Posta adresi';

  @override
  String get password => 'Şifre';

  @override
  String get repeat_password => 'Şifreni Tekrarla';

  @override
  String get birthdate => 'Doğum tarihi';

  @override
  String get forgot_password => 'Şifreni mi unuttun?';

  @override
  String get back_to_login => 'Giriş ekranına dön';

  @override
  String get sign_in => 'Giriş';

  @override
  String get sign_up => 'Kayıt ol';

  @override
  String get reset_password => 'Şifremi yenile';

  @override
  String get not_a_user_yet => 'Henüz Publisher değilmisin?';

  @override
  String get already_a_user_yet => 'Zaten Publisher misin?';

  @override
  String get register => 'Kayıt ol';

  @override
  String get google_login => 'Google ile giriş yap';

  @override
  String get facebook_login => 'Facebook ile giriş yap';

  @override
  String get apple_login => 'Apple ile giriş yap';

  @override
  String get required => 'Gerekli';

  @override
  String get min_length_password => 'Şifre en az 6 haneli olmalıdır';

  @override
  String get special_character => 'Şifrede en az bir özel karakter olmalıdır';

  @override
  String get email_is_required => 'E-Mail address is required';

  @override
  String get not_a_valid_email => 'E-posta adresi gereklidir';

  @override
  String get shout => 'Haykır...';

  @override
  String get whisper => 'Fısılda...';

  @override
  String get close => 'Kapat';

  @override
  String get current_location => 'Mevcut konum';

  @override
  String get choose_another_location => 'Başka bir konum seç';

  @override
  String get press_to_see_picture => 'Resmi görmek için basılı tutun';

  @override
  String get press_to_see_video => 'Videoyu izlemek için basılı tutun';

  @override
  String get turn_on_location_service_message => 'ZoneWhisper\'ı kullanabilmek için konum bilgilerini etkinleştirmelisin';

  @override
  String get go_to_settings => 'Ayarları aç';
}
