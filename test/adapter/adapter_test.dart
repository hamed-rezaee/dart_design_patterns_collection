import 'package:test/test.dart';

import 'package:dart_design_patterns/adapter/adapter.dart';

void main() {
  group('Adapter pattern test =>', () {
    test(
        'Client code calls the Target interface and Adaptee\'s specificRequest method is invoked.',
        () {
      final Adaptee adaptee = Adaptee();
      final Adapter adapter = Adapter(adaptee);

      expect(
        () => clientCode(adapter),
        prints("Adaptee's specificRequest called.\n"),
      );
    });
  });
}
