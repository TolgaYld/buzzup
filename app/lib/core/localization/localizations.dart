import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_de.dart';
import 'localizations_en.dart';
import 'localizations_es.dart';
import 'localizations_fr.dart';
import 'localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('tr')
  ];

  /// No description provided for @language.
  ///
  /// In de, this message translates to:
  /// **'Deutsch'**
  String get language;

  /// No description provided for @username.
  ///
  /// In de, this message translates to:
  /// **'Benutzername'**
  String get username;

  /// No description provided for @email_or_username.
  ///
  /// In de, this message translates to:
  /// **'Benutzername oder E-Mail'**
  String get email_or_username;

  /// No description provided for @email_adress.
  ///
  /// In de, this message translates to:
  /// **'E-Mail Adresse'**
  String get email_adress;

  /// No description provided for @password.
  ///
  /// In de, this message translates to:
  /// **'Passwort'**
  String get password;

  /// No description provided for @repeat_password.
  ///
  /// In de, this message translates to:
  /// **'Passwort wiederholen'**
  String get repeat_password;

  /// No description provided for @birthdate.
  ///
  /// In de, this message translates to:
  /// **'Geburtsdatum'**
  String get birthdate;

  /// No description provided for @forgot_password.
  ///
  /// In de, this message translates to:
  /// **'Passwort vergessen?'**
  String get forgot_password;

  /// No description provided for @back_to_login.
  ///
  /// In de, this message translates to:
  /// **'Zurück zum Login'**
  String get back_to_login;

  /// No description provided for @sign_in.
  ///
  /// In de, this message translates to:
  /// **'Login'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In de, this message translates to:
  /// **'Registrieren'**
  String get sign_up;

  /// No description provided for @reset_password.
  ///
  /// In de, this message translates to:
  /// **'Passwort zurücksetzen'**
  String get reset_password;

  /// No description provided for @not_a_user_yet.
  ///
  /// In de, this message translates to:
  /// **'Noch kein account?'**
  String get not_a_user_yet;

  /// No description provided for @already_a_user_yet.
  ///
  /// In de, this message translates to:
  /// **'Du hast dich schon registriert?'**
  String get already_a_user_yet;

  /// No description provided for @register.
  ///
  /// In de, this message translates to:
  /// **'Registrieren'**
  String get register;

  /// No description provided for @google_login.
  ///
  /// In de, this message translates to:
  /// **'Anmelden mit Google'**
  String get google_login;

  /// No description provided for @facebook_login.
  ///
  /// In de, this message translates to:
  /// **'Anmelden mit Facebook'**
  String get facebook_login;

  /// No description provided for @apple_login.
  ///
  /// In de, this message translates to:
  /// **'Anmelden mit Apple'**
  String get apple_login;

  /// No description provided for @required.
  ///
  /// In de, this message translates to:
  /// **'Pflichtfeld'**
  String get required;

  /// No description provided for @min_length_password.
  ///
  /// In de, this message translates to:
  /// **'Mindestens 8 Zeichen'**
  String get min_length_password;

  /// No description provided for @special_character.
  ///
  /// In de, this message translates to:
  /// **'Mindestens ein Sonderzeichen'**
  String get special_character;

  /// No description provided for @email_is_required.
  ///
  /// In de, this message translates to:
  /// **'E-Mail adresse eingeben'**
  String get email_is_required;

  /// No description provided for @not_a_valid_email.
  ///
  /// In de, this message translates to:
  /// **'Tippe eine gültige E-Mail addresse ein'**
  String get not_a_valid_email;

  /// No description provided for @shout.
  ///
  /// In de, this message translates to:
  /// **'Shout...'**
  String get shout;

  /// No description provided for @whisper.
  ///
  /// In de, this message translates to:
  /// **'Whisper...'**
  String get whisper;

  /// No description provided for @close.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get close;

  /// No description provided for @current_location.
  ///
  /// In de, this message translates to:
  /// **'Aktueller Standort'**
  String get current_location;

  /// No description provided for @choose_another_location.
  ///
  /// In de, this message translates to:
  /// **'Anderen Standort auswählen'**
  String get choose_another_location;

  /// No description provided for @press_to_see_picture.
  ///
  /// In de, this message translates to:
  /// **'Gedrückt halten um das Bild zu sehen'**
  String get press_to_see_picture;

  /// No description provided for @press_to_see_video.
  ///
  /// In de, this message translates to:
  /// **'Gedrückt halten um das Video zu sehen'**
  String get press_to_see_video;

  /// No description provided for @turn_on_location_service_message.
  ///
  /// In de, this message translates to:
  /// **'Du musst deine Ortungsdienste aktivieren, damit du ZoneWhisper benutzen kannst'**
  String get turn_on_location_service_message;

  /// No description provided for @go_to_settings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen öffnen'**
  String get go_to_settings;

  /// No description provided for @not_empty_spaces.
  ///
  /// In de, this message translates to:
  /// **'Darf keine Leerzeichen enthalten'**
  String get not_empty_spaces;

  /// No description provided for @invalid_input.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Eingabe'**
  String get invalid_input;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In de, this message translates to:
  /// **'Passwörter stimmen nicht überein'**
  String get passwords_do_not_match;

  /// No description provided for @minimum_length_of_input.
  ///
  /// In de, this message translates to:
  /// **'Mindestens {count} Zeichen'**
  String minimum_length_of_input(Object count);

  /// No description provided for @or.
  ///
  /// In de, this message translates to:
  /// **'Oder'**
  String get or;

  /// No description provided for @login_via_google.
  ///
  /// In de, this message translates to:
  /// **'Mit Google anmelden'**
  String get login_via_google;

  /// No description provided for @login_via_facebook.
  ///
  /// In de, this message translates to:
  /// **'Mit Facebook anmelden'**
  String get login_via_facebook;

  /// No description provided for @login_via_apple.
  ///
  /// In de, this message translates to:
  /// **'Mit Apple anmelden'**
  String get login_via_apple;

  /// No description provided for @login_failed.
  ///
  /// In de, this message translates to:
  /// **'Anmeldung fehlgeschlagen'**
  String get login_failed;

  /// No description provided for @oopsMessage.
  ///
  /// In de, this message translates to:
  /// **'Ups, das hat nicht geklappt. Versuch’s später nochmal.'**
  String get oopsMessage;

  /// No description provided for @home.
  ///
  /// In de, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @channels.
  ///
  /// In de, this message translates to:
  /// **'Channels'**
  String get channels;

  /// No description provided for @chats.
  ///
  /// In de, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @profile.
  ///
  /// In de, this message translates to:
  /// **'Profil'**
  String get profile;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return L10nDe();
    case 'en': return L10nEn();
    case 'es': return L10nEs();
    case 'fr': return L10nFr();
    case 'tr': return L10nTr();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
