import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;

const privateKey = '8a260cf9a913bdf886bf61c827685f1b'; 
const publicKey = '9de7d178dfcc670d';
const signature = "ns4XeYYRlq2Y8y73T4Wug/p0ipjzhaIvYCfA0lk9McQ="; 

dynamic decrypt(String encryptedText, String privateKey, String publicKey) {
  final keyObj = encrypt.Key.fromUtf8(privateKey);
  final ivObj = encrypt.IV.fromUtf8(publicKey);
  final encrypter =
      encrypt.Encrypter(encrypt.AES(keyObj, mode: encrypt.AESMode.cbc));

  try {
    final decrypted = encrypter
        .decrypt(encrypt.Encrypted.fromBase64(encryptedText), iv: ivObj);
    return decrypted;
  } catch (e) {
    return 'Error....................';
  }
}

String encryptData(
    Map<String, dynamic> data, String privateKey, String publicKey) {
  final key = encrypt.Key.fromUtf8(privateKey);
  final iv = encrypt.IV.fromUtf8(publicKey);
  final encrypter = encrypt.Encrypter(
    encrypt.AES(key, mode: encrypt.AESMode.cbc),
  );
  try {
    String jsonString = json.encode(data);
    final encrypted = encrypter.encrypt(jsonString, iv: iv);
    final encryptedText = encrypted.base64;
    return encryptedText;
  } catch (e) {
    return 'Error....................';
  }
}
