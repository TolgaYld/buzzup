// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class L10nFr extends L10n {
  L10nFr([String locale = 'fr']) : super(locale);

  @override
  String get language => 'Français';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get email_or_username => 'Nom d\'utilisateur ou E-Mail';

  @override
  String get email_adress => 'Adresse E-Mail';

  @override
  String get password => 'Mot de passe';

  @override
  String get repeat_password => 'Répéter le mot de passe';

  @override
  String get birthdate => 'Date de naissance';

  @override
  String get forgot_password => 'Mot de passe oublié?';

  @override
  String get back_to_login => 'Retour à la connexion';

  @override
  String get sign_in => 'Connexion';

  @override
  String get sign_up => 'Inscription';

  @override
  String get reset_password => 'Réinitialiser le mot de passe';

  @override
  String get not_a_user_yet => 'Pas encore éditeur?';

  @override
  String get already_a_user_yet => 'Déjà éditeur?';

  @override
  String get register => 'S\'inscrire';

  @override
  String get google_login => 'Connexion Google';

  @override
  String get facebook_login => 'Connexion Facebook';

  @override
  String get apple_login => 'Connexion Apple';

  @override
  String get required => 'Requis';

  @override
  String get min_length_password => 'Le mot de passe doit comporter au moins 8 caractères';

  @override
  String get special_character => 'Le mot de passe doit comporter au moins un caractère spécial';

  @override
  String get email_is_required => 'L\'adresse E-Mail est requise';

  @override
  String get not_a_valid_email => 'Entrez une adresse E-Mail valide';

  @override
  String get shout => 'Crier...';

  @override
  String get whisper => 'Chuchoter...';

  @override
  String get close => 'Fermer';

  @override
  String get current_location => 'Localisation actuelle';

  @override
  String get choose_another_location => 'Choisir un autre emplacement';

  @override
  String get press_to_see_picture => 'Appuyez et maintenez pour voir l\'image';

  @override
  String get press_to_see_video => 'Appuyez et maintenez pour regarder la vidéo';

  @override
  String get turn_on_location_service_message => 'Vous devez activer vos services de localisation pour utiliser ZoneWhisper';

  @override
  String get go_to_settings => 'Ouvrir les paramètres';

  @override
  String get not_empty_spaces => 'Ne doit pas contenir d\'espaces';

  @override
  String get invalid_input => 'Entrée invalide';

  @override
  String get passwords_do_not_match => 'Les mots de passe ne correspondent pas';

  @override
  String minimum_length_of_input(Object count) {
    return 'Minimum $count caractères';
  }

  @override
  String get or => 'Ou';

  @override
  String get login_via_google => 'Connexion via Google';

  @override
  String get login_via_facebook => 'Connexion via Facebook';

  @override
  String get login_via_apple => 'Connexion via Apple';

  @override
  String get login_failed => 'Échec de la connexion';

  @override
  String get oopsMessage => 'Oups ! Ça n’a pas marché. Essaie plus tard.';

  @override
  String get home => 'Accueil';

  @override
  String get channels => 'Canaux';

  @override
  String get chats => 'Chats';

  @override
  String get profile => 'Profil';

  @override
  String get post => 'Vib3';

  @override
  String get shareVib3Hint => 'Lâche ton Vib3...';
}
