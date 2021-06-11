

import 'package:flutter/cupertino.dart';
import 'package:flutter_number_fact/app.dart';
import 'injection_container.dart' as di;
Future<void> main() async{
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
