import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class L10nDe extends L10n {
  L10nDe([String locale = 'de']) : super(locale);

  @override
  String get language => 'Deutsch';

  @override
  String get username => 'Benutzername';

  @override
  String get email_or_username => 'Benutzername oder E-Mail';

  @override
  String get email_adress => 'E-Mail Adresse';

  @override
  String get password => 'Passwort';

  @override
  String get repeat_password => 'Passwort wiederholen';

  @override
  String get birthdate => 'Geburtsdatum';

  @override
  String get forgot_password => 'Passwort vergessen?';

  @override
  String get back_to_login => 'Zurück zum Login';

  @override
  String get sign_in => 'Login';

  @override
  String get sign_up => 'Registrieren';

  @override
  String get reset_password => 'Passwort zurücksetzen';

  @override
  String get not_a_user_yet => 'Noch kein account?';

  @override
  String get already_a_user_yet => 'Du hast dich schon registriert?';

  @override
  String get register => 'Registrieren';

  @override
  String get google_login => 'Anmelden mit Google';

  @override
  String get facebook_login => 'Anmelden mit Facebook';

  @override
  String get apple_login => 'Anmelden mit Apple';

  @override
  String get required => 'Pflichtfeld';

  @override
  String get min_length_password => 'Mindestens 8 Zeichen';

  @override
  String get special_character => 'Mindestens ein Sonderzeichen';

  @override
  String get email_is_required => 'E-Mail adresse eingeben';

  @override
  String get not_a_valid_email => 'Tippe eine gültige E-Mail addresse ein';

  @override
  String get shout => 'Shout...';

  @override
  String get whisper => 'Whisper...';

  @override
  String get close => 'Schließen';

  @override
  String get current_location => 'Aktueller Standort';

  @override
  String get choose_another_location => 'Anderen Standort auswählen';

  @override
  String get press_to_see_picture => 'Gedrückt halten um das Bild zu sehen';

  @override
  String get press_to_see_video => 'Gedrückt halten um das Video zu sehen';

  @override
  String get turn_on_location_service_message => 'Du musst deine Ortungsdienste aktivieren, damit du ZoneWhisper benutzen kannst';

  @override
  String get go_to_settings => 'Einstellungen öffnen';

  @override
  String get not_empty_spaces => 'Darf keine Leerzeichen enthalten';

  @override
  String get invalid_input => 'Ungültige Eingabe';

  @override
  String get passwords_do_not_match => 'Passwörter stimmen nicht überein';

  @override
  String minimum_length_of_input(Object count) {
    return 'Mindestens $count Zeichen';
  }

  @override
  String get or => 'Oder';

  @override
  String get login_via_google => 'Mit Google anmelden';

  @override
  String get login_via_facebook => 'Mit Facebook anmelden';

  @override
  String get login_via_apple => 'Mit Apple anmelden';
}
