import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flowo/data/services/local_storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('returns default username Miracle when no username is saved', () async {
    final name = await LocalStorageService.getUsername();
    expect(name, 'Miracle');
  });

  test('saves and retrieves custom username', () async {
    await LocalStorageService.saveUsername('Alex');
    final name = await LocalStorageService.getUsername();
    expect(name, 'Alex');
  });

  test('clearing storage falls back to default username', () async {
    await LocalStorageService.saveUsername('Alex');
    await LocalStorageService.clear();
    final name = await LocalStorageService.getUsername();
    expect(name, 'Miracle');
  });
}
