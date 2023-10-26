
import 'my_checker_platform_interface.dart';

class MyChecker {
  Future<String?> getPlatformVersion() {
    return MyCheckerPlatform.instance.getPlatformVersion();
  }
}
