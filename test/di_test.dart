import 'package:poster/di/app_module.dart';
import 'package:test/test.dart';

void main() {
  test('Check dependency graph', () {
    di.registerAppModule().forEach((type) => expect(canRetrieve(type), true));
  });
}

bool canRetrieve(Type type) {
  try {
    di.get(type: type);
    return true;
  } catch (_) {
    return false;
  }
}
