import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:macro_sync_client/home_page/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:macro_sync_client/home_page/providers/exports_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ConnectButtonProvider()),
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
    return const MaterialApp(
      title: 'Macro Sync Helldivers 2 Edition',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
