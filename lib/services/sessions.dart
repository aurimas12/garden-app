import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static const _kAccountIdKey = 'account_id';
  static const _kPinKey = 'pin_str'; // PIN saugom kaip tekstą


  static Future<void> fixLegacy() async {
    final sp = await SharedPreferences.getInstance();


    final curr = sp.getString(_kPinKey);
    if (curr != null) return;


    final iNow = sp.getInt(_kPinKey);
    if (iNow != null) {
      final pin = iNow.toString().padLeft(6, '0');
      await sp.remove(_kPinKey);
      await sp.setString(_kPinKey, pin);
      return;
    }


    final legacyS = sp.getString('pin');
    if (legacyS != null) {
      await sp.setString(_kPinKey, legacyS);
      await sp.remove('pin');
      return;
    }
    final legacyI = sp.getInt('pin');
    if (legacyI != null) {
      final pin = legacyI.toString().padLeft(6, '0');
      await sp.setString(_kPinKey, pin);
      await sp.remove('pin');
      return;
    }
  }

  // ---------- Account ID ----------
  static Future<void> saveAccountId(int id) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setInt(_kAccountIdKey, id);
  }

  static Future<int?> getAccountId() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt(_kAccountIdKey);
  }

  // ---------- PIN ----------
  static Future<void> savePin(String pin) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kPinKey, pin);
  }

  static Future<String?> getPin() async {
    final sp = await SharedPreferences.getInstance();
    // jei kažkas dar liko legacy – pabandyk pataisyti „on-demand“
    final s = sp.getString(_kPinKey);
    if (s != null) return s;

    final i = sp.getInt(_kPinKey);
    if (i != null) {
      final pin = i.toString().padLeft(6, '0');
      await sp.remove(_kPinKey);
      await sp.setString(_kPinKey, pin);
      return pin;
    }

    final legacyS = sp.getString('pin');
    if (legacyS != null) {
      await sp.setString(_kPinKey, legacyS);
      await sp.remove('pin');
      return legacyS;
    }
    final legacyI = sp.getInt('pin');
    if (legacyI != null) {
      final pin = legacyI.toString().padLeft(6, '0');
      await sp.setString(_kPinKey, pin);
      await sp.remove('pin');
      return pin;
    }

    return null;
  }

  static Future<int> requireId() async {
    final id = await getAccountId();
    if (id == null) {
      throw Exception('Nėra account_id sesijoje (neprisijungta).');
    }
    return id;
  }

  static Future<void> clear() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(_kAccountIdKey);
    await sp.remove(_kPinKey);
    await sp.remove('pin'); // legacy
  }
}
