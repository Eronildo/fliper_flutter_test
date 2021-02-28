import 'package:fliper_flutter_test/core/data/configs/app_config.dart';
import 'package:fliper_flutter_test/core/data/factories/factories.dart';
import 'package:fliper_flutter_test/core/presentation/views/home_page.dart';
import 'package:fliper_flutter_test/core/presentation/themes/app_theme.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_controller.dart';
import 'package:flutter/material.dart';

import 'core/presentation/views/components/providers/provider.dart';

AppConfig appConfig;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appConfig = await AppConfig().load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fliper Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: Provider<SummaryController>(
        data: makeSummaryController(appConfig),
        child: HomePage(),
      ),
    );
  }
}
