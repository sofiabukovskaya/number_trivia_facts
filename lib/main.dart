

import 'package:flutter/cupertino.dart';
import 'injection_container.dart' as di;
Future<void> main() async{
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
}
