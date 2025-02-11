mixin GqlPostQuerys {
  static const String checkEmailExistsQuery = '''
query Query(\$email: String!) {
  checkIfEmailExists(email: \$email)
}
''';

  static const String checkUsernameExistsQuery = '''
query Query(\$username: String!) {
  checkIfUsernameExists(username: \$username)

}
''';

  static const String signOut = '''
query Query {
  signOut {
   _id, 
  }
}
''';

  static const String refreshToken = '''
query Query {
  refreshToken {
    token
    refreshToken
    firebaseAuthToken
  }
}
''';
}
