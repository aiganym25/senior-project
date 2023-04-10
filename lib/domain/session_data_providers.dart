import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session-id';
  static const userName = 'user-name';
}

class SessionDataProvider {
  static const _securityStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _securityStorage.read(key: _Keys.sessionId);
  Future<void> setSessionId(String value) =>
      _securityStorage.write(key: _Keys.sessionId, value: value);

  Future<String?> getUserName() => _securityStorage.read(key: _Keys.userName);
  Future<void> setUserName(String value) =>
      _securityStorage.write(key: _Keys.userName, value: value);
}
