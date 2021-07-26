import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _AUTH_TOKEN = 'AUTH_TOKEN';

class StoreInteractor {
  final SharedPreferences _sharedPreferences;

  static Future<StoreInteractor> create() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return StoreInteractor._(sharedPreferences);
  }

  StoreInteractor._(this._sharedPreferences);

  String? getAccessToken() {
    return _sharedPreferences.getString(_AUTH_TOKEN);
  }

  Future<void> setAccessToken(String token) async {
    await _sharedPreferences.setString(_AUTH_TOKEN, token);
  }

  Future<void> removeAccessToken() async {
    await _sharedPreferences.remove(_AUTH_TOKEN);
  }
}

@module
abstract class InteractorRegisterModule {
  @preResolve
  Future<StoreInteractor> get interactor => StoreInteractor.create();
}
