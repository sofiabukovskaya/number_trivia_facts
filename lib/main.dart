

import 'package:flutter/cupertino.dart';
import 'package:flutter_number_fact/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SharedPreferences.setMockInitialValues({});
  runApp(App());
}
