import 'localizations.dart';

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get language => 'Español';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get email_or_username => 'Nombre de usuario o correo electrónico';

  @override
  String get email_adress => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get repeat_password => 'Repite la contraseña';

  @override
  String get birthdate => 'Cumpleaños';

  @override
  String get forgot_password => '¿Olvidaste tu contraseña?';

  @override
  String get back_to_login => 'Atrás para iniciar sesión';

  @override
  String get sign_in => 'Iniciar sesión';

  @override
  String get sign_up => 'Inscribirse';

  @override
  String get reset_password => 'Restablecer su contraseña';

  @override
  String get not_a_user_yet => '¿Aún no eres Publisher?';

  @override
  String get already_a_user_yet => '¿Ya eres Publisher?';

  @override
  String get register => 'Inscribirse';

  @override
  String get google_login => 'Inicia sesión con Google';

  @override
  String get facebook_login => 'Inicia sesión con Facebook';

  @override
  String get apple_login => 'Inicia sesión con Apple';

  @override
  String get required => 'Requerido';

  @override
  String get min_length_password => 'La contraseña debe tener al menos 6 dígitos';

  @override
  String get special_character => 'La contraseña debe tener al menos un carácter especial';

  @override
  String get email_is_required => 'Se requiere Dirección de correo electrónico';

  @override
  String get not_a_valid_email => 'Introduzca una dirección de correo electrónico válida';

  @override
  String get shout => '';

  @override
  String get whisper => 'Comparte una publication...';

  @override
  String get close => 'Cerrar';

  @override
  String get current_location => 'Ubicación actual';

  @override
  String get choose_another_location => 'Elija otra ubicación';

  @override
  String get press_to_see_picture => 'Mantenga pulsado para ver la imagen';

  @override
  String get press_to_see_video => 'Mantenga presionado para ver el video';

  @override
  String get turn_on_location_service_message => 'Debes activar tus servicios de ubicación para usar ZoneWhisper';

  @override
  String get go_to_settings => 'Ir a la configuración';
}
