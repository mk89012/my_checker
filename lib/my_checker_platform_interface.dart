import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_checker_method_channel.dart';

abstract class MyCheckerPlatform extends PlatformInterface {
  /// Constructs a MyCheckerPlatform.
  MyCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyCheckerPlatform _instance = MethodChannelMyChecker();

  /// The default instance of [MyCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyChecker].
  static MyCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyCheckerPlatform] when
  /// they register themselves.
  static set instance(MyCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
