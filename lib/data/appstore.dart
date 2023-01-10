import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'appstore.g.dart';
//Após atualizar o código, rodar no terminal : flutter packages pub run build_runner build

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "https://placehold.it/200";

  @observable
  String token = "";

  @action
  void setUser(String pName, String pEmail, String pPicture, String pToken) {
    name = pName;
    email = pEmail;
    picture = pPicture;
    token = pToken;
  }

  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> saveMap(String key, Map<String, dynamic> value) async {
    return saveString(key, jsonEncode(value));
  }

  static Future<String> getString(String key,
      [String defaultValue = '']) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      return jsonDecode(await getString(key));
    } catch (_) {
      return {};
    }
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
