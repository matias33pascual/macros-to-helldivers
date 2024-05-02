import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/providers/exports_providers.dart';
import 'package:macro_sync_client/home_page/screens/home_page.dart';
import 'package:macro_sync_client/mission_page/providers/mission_provider.dart';
import 'package:macro_sync_client/mission_page/screens/mission_page.dart';
import 'package:macro_sync_client/stratagems_page/providers/exports_providers.dart';
import 'package:macro_sync_client/stratagems_page/screens/stratagems_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ConnectButtonProvider()),
        ChangeNotifierProvider(create: (_) => StratagemsProvider()),
        ChangeNotifierProvider(create: (_) => TabsMenuProvider()),
        ChangeNotifierProvider(create: (_) => SelectedProvider()),
        ChangeNotifierProvider(create: (_) => MissionProvider()),
      ],
      child: kDebugMode == true
          ? DevicePreview(
              enabled: true,
              tools: const [...DevicePreview.defaultTools],
              builder: (context) => const MyApp(),
            )
          : const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        StratagemsPage.routeName: (context) => const StratagemsPage(),
        MissionPage.routeName: (context) => const MissionPage(),
      },
      title: 'Macro Sync',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
    );
  }
}
