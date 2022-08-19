
import 'android_raw_read_platform_interface.dart';

class AndroidRawRead {
  Future<String?> getPlatformVersion() {
    return AndroidRawReadPlatform.instance.getPlatformVersion();
  }

  Future readRawFile(String rawName){
    return AndroidRawReadPlatform.instance.readRawFile(rawName);
  }

}
