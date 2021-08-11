class AuthServices {
  AuthServices._();

  static AuthServices? _instance;

  static AuthServices get instance {
    if(_instance == null) {
      _instance = AuthServices._();
    }
    return _instance!;
  }
}