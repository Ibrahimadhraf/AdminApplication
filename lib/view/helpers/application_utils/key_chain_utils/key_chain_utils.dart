import 'package:flutter_keychain/flutter_keychain.dart';

class KeyChainUtils {
  KeyChainUtils._internal();

  static final KeyChainUtils _instance = KeyChainUtils._internal();

  factory KeyChainUtils() => _instance;

  // store email
  storeEmail({String? email}) async {
    await FlutterKeychain.put(key: "email", value: "$email");
  }

  // get sessionId
  Future<String?> getEmail() async {
    return FlutterKeychain.get(key: "email");
  }

}
