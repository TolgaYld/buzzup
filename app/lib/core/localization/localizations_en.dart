import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get username => 'Username';

  @override
  String get email_or_username => 'Username or E-Mail';

  @override
  String get email_adress => 'E-Mail address';

  @override
  String get password => 'Password';

  @override
  String get repeat_password => 'Repeat Password';

  @override
  String get birthdate => 'Birthdate';

  @override
  String get forgot_password => 'Forgot password?';

  @override
  String get back_to_login => 'Back to Login';

  @override
  String get sign_in => 'Login';

  @override
  String get sign_up => 'Sign Up';

  @override
  String get reset_password => 'Reset password';

  @override
  String get not_a_user_yet => 'Not a publisher yet?';

  @override
  String get already_a_user_yet => 'Already a Publisher?';

  @override
  String get register => 'Register';

  @override
  String get google_login => 'Google Sign In';

  @override
  String get facebook_login => 'Facebook Sign In';

  @override
  String get apple_login => 'Apple Sign In';

  @override
  String get required => 'Required';

  @override
  String get min_length_password => 'Password must be at least 8 digits';

  @override
  String get special_character => 'Password must have at least one special character';

  @override
  String get email_is_required => 'E-Mail address is required';

  @override
  String get not_a_valid_email => 'Enter a valid e-mail address';

  @override
  String get shout => 'Shout...';

  @override
  String get whisper => 'Whisper...';

  @override
  String get close => 'Close';

  @override
  String get current_location => 'Current location';

  @override
  String get choose_another_location => 'Choose another location';

  @override
  String get press_to_see_picture => 'Press and hold to see the picture';

  @override
  String get press_to_see_video => 'Press and hold to watch the video';

  @override
  String get turn_on_location_service_message => 'You must turn on your location services to use ZoneWhisper';

  @override
  String get go_to_settings => 'Open settings';

  @override
  String get not_empty_spaces => 'Must not contain spaces';

  @override
  String get invalid_input => 'Invalid input';

  @override
  String get passwords_do_not_match => 'Passwords do not match';

  @override
  String minimum_length_of_input(Object count) {
    return 'Minimum $count characters';
  }

  @override
  String get or => 'Or';

  @override
  String get login_via_google => 'Login via Google';

  @override
  String get login_via_facebook => 'Login via Facebook';

  @override
  String get login_via_apple => 'Login via Apple';
}
