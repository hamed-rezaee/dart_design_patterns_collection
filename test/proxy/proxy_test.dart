import 'package:test/test.dart';

import 'package:dart_design_patterns/proxy/proxy.dart';

void main() {
  group('Proxy pattern test =>', () {
    test('request() method should forward message to RealSubject.', () {
      const String message = 'Hello, world!';

      final Proxy<String> proxy = Proxy<String>();

      expect(
        () => proxy.request(message),
        prints('RealSubject: Handling request with message $message.\n'),
      );
    });
  });
}
