import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final class FCMTokenStore {
  static const _keyFCMToken = 'fcm_token';

  Future<String?> get token =>
    RxSharedPreferences.getInstance().getString(_keyFCMToken);

  Future<void> storeToken(String token) =>
    RxSharedPreferences.getInstance().setString(_keyFCMToken, token);
}
