class AuthenticationEvent
{
    bool _requestUserRetrieval;
    String _authenticationToken;

  String get authenticationToken => _authenticationToken;

  set authenticationToken(String value) {
    _authenticationToken = value;
  }

  bool get requestUserRetrieval => _requestUserRetrieval;

  set requestUserRetrieval(bool value) {
    _requestUserRetrieval = value;
  }
}