import 'package:flutter_test/flutter_test.dart';
import 'package:my_checker/my_checker.dart';
import 'package:my_checker/my_checker_platform_interface.dart';
import 'package:my_checker/my_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyCheckerPlatform
    with MockPlatformInterfaceMixin
    implements MyCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyCheckerPlatform initialPlatform = MyCheckerPlatform.instance;

  test('$MethodChannelMyChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyChecker>());
  });

  test('getPlatformVersion', () async {
    MyChecker myCheckerPlugin = MyChecker();
    MockMyCheckerPlatform fakePlatform = MockMyCheckerPlatform();
    MyCheckerPlatform.instance = fakePlatform;

    expect(await myCheckerPlugin.getPlatformVersion(), '42');
  });
}
