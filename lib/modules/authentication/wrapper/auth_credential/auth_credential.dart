abstract class AuthCredential {
  const AuthCredential(this.url);

  /// Returns the data for this credential serialized as a map.
  Map<String, dynamic> asMap();

  /// url is used to communicate with API
  final String url;

  @override
  String toString() => asMap().toString();
}
