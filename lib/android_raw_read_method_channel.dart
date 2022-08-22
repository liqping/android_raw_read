import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_raw_read_platform_interface.dart';

/// An implementation of [AndroidRawReadPlatform] that uses method channels.
class MethodChannelAndroidRawRead extends AndroidRawReadPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_raw_read');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String?> readRawFile(String rawName) async{
    return await methodChannel.invokeMethod('readRawFile',rawName);
  }

}
