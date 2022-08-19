import 'package:flutter_test/flutter_test.dart';
import 'package:android_raw_read/android_raw_read.dart';
import 'package:android_raw_read/android_raw_read_platform_interface.dart';
import 'package:android_raw_read/android_raw_read_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidRawReadPlatform 
    with MockPlatformInterfaceMixin
    implements AndroidRawReadPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidRawReadPlatform initialPlatform = AndroidRawReadPlatform.instance;

  test('$MethodChannelAndroidRawRead is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidRawRead>());
  });

  test('getPlatformVersion', () async {
    AndroidRawRead androidRawReadPlugin = AndroidRawRead();
    MockAndroidRawReadPlatform fakePlatform = MockAndroidRawReadPlatform();
    AndroidRawReadPlatform.instance = fakePlatform;
  
    expect(await androidRawReadPlugin.getPlatformVersion(), '42');
  });
}
