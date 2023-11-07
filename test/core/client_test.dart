import 'package:test/test.dart';
import 'package:dart_web3_core/dart_web3_core.dart';

import '../mock_client.dart';

void main() {
  test('getClientVersion', () async {
    final client = MockClient(expectAsync2((method, data) {
      expect(method, 'web3_clientVersion');
      return 'dart-dart_web3_core-test';
    }));
    final web3 = Web3Client('', client);
    addTearDown(web3.dispose);

    expect(web3.getClientVersion(), completion('dart-dart_web3_core-test'));
  });
}
