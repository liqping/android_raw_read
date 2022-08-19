import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_raw_read/android_raw_read_method_channel.dart';

void main() {
  MethodChannelAndroidRawRead platform = MethodChannelAndroidRawRead();
  const MethodChannel channel = MethodChannel('android_raw_read');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
