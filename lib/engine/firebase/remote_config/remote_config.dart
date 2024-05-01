import 'dart:developer';

import 'package:aidafine/engine/firebase/remote_config/remote_config_consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  factory RemoteConfig() {
    return _singleton;
  }
  RemoteConfig._();
  static final RemoteConfig _singleton = RemoteConfig._();

  static late FirebaseRemoteConfig _remoteConfig;

  static String? get geminiAPIKey {
    return _remoteConfig.getString(
      RemoteConfigConsts.geminiAPIKey,
    );
  }

  static Future<void> initialize({
    required FirebaseRemoteConfig remoteConfig,
  }) async {
    _remoteConfig = remoteConfig;
    try {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 3),
          minimumFetchInterval:
              // FlavorConfig.isDevelopment
              //     ? const Duration(seconds: 5)
              //     :
              // const Duration(hours: 12),
              const Duration(minutes: 10),
        ),
      );
      await _remoteConfig.fetchAndActivate();
    } on FirebaseException catch (e) {
      log('RemoteConfigRepo (initialze): ${e.code}');
    } catch (e) {
      log('unable to fetch remote config. default value will be used');
    }
  }
}
