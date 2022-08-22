import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_raw_read_method_channel.dart';

abstract class AndroidRawReadPlatform extends PlatformInterface {
  /// Constructs a AndroidRawReadPlatform.
  AndroidRawReadPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidRawReadPlatform _instance = MethodChannelAndroidRawRead();

  /// The default instance of [AndroidRawReadPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidRawRead].
  static AndroidRawReadPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidRawReadPlatform] when
  /// they register themselves.
  static set instance(AndroidRawReadPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> readRawFile(String rawName) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
