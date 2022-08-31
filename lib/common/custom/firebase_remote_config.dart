import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

const String remoteConfigString = "vms_remoteConfig_stringKey";
const String remoteConfigInt = "vms_remoteconfig_intKey";
const String remoteConfigBool = "vms_remoteConfig_Boolkey";

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;
  RemoteConfigService({FirebaseRemoteConfig? remoteConfig})
      : _remoteConfig = remoteConfig!;

  final defaults = <String, dynamic>{
    remoteConfigBool: false,
    remoteConfigInt: 01,
    remoteConfigString: "Flutter Firebase",
  };

  static RemoteConfigService? _instance;
  static Future<RemoteConfigService> getInstance() async {
    _instance ??= RemoteConfigService(
      remoteConfig: FirebaseRemoteConfig.instance,
    );
    return _instance!;
  }

  bool get getBoolValue => _remoteConfig.getBool(remoteConfigBool);
  int get getIntValue => _remoteConfig.getInt(remoteConfigInt);
  String get getStringValue => _remoteConfig.getString(remoteConfigString);

  Future initialize() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _fetchAndActivate();
    } on PlatformException catch (e) {
      log("Rmeote Config fetch throttled: $e");
    } catch (e) {
      log("Unable to fetch remote config. Default value will be used");
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));
    await _remoteConfig.fetchAndActivate();
    log("boolean:$getBoolValue");
    log("int:$getIntValue");
    log("string:$getStringValue");
  }
}
