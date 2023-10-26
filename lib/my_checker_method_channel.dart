import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_checker_platform_interface.dart';

/// An implementation of [MyCheckerPlatform] that uses method channels.
class MethodChannelMyChecker extends MyCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
