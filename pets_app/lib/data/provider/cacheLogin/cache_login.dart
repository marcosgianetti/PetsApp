import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/entities/entities.dart';

abstract class ICacheLogin {
  Future setLoginResponse({required User user});
  Future<User> getLoginCache();
}

class CacheLogin {
  static Future setLoginResponse({required User user}) async {
    await _initBox();

    Box _userBox = await Hive.openBox('userBox');

    _userBox.put('user', user);

    Hive.close();
  }

  static Future _initBox() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);

    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter<User>(UserAdapter());
  }

  static Future<User> getLoginCache() async {
    await _initBox();
    if (!await Hive.boxExists('userBox')) {
      return User();
    }
    Box _userBox = await Hive.openBox('userBox');

    return _userBox.get('user');
  }

  static Future clean() async {
    await setLoginResponse(user: User());
  }
}
