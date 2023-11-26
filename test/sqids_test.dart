import 'package:sqids/sqids.dart';
import 'package:test/test.dart';

void main() {
  test('Simple encode & decode', () {
    final sqids = Sqids();
    final ids = [1, 2, 3];
    expect(sqids.encode(ids), "86Rf07");
    expect(sqids.decode("86Rf07"), ids);
  });
  test('Enforce a minimum length for IDs', () {
    final sqids = Sqids(minLength: 10);
    final ids = [1, 2, 3];
    expect(sqids.encode(ids), "86Rf07xd4z");
    expect(sqids.decode("86Rf07xd4z"), ids);
  });
  test('Randomize IDs by providing a custom alphabet', () {
    final sqids = Sqids(
      alphabet:
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%&*()-_+|{}[];:\'"/?.>,<`~',
    );
    final ids = [1, 2, 3];
    expect(sqids.decode(sqids.encode(ids)), ids);
  });
}
