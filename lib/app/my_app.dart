import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:store/app/my_app_controller.dart';
import 'package:store/core/enums/connectivity_statues.dart';
import 'package:store/core/translation/app_translation.dart';
import 'package:store/ui/shared/shared_widget/utils.dart';
import 'package:store/ui/views/main_view/home_view/home_view.dart';
import 'package:store/ui/views/main_view/main_view.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MyAppController controller = Get.put(MyAppController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (BuildContext context) =>
          connectivityService.connectivityStatusController.stream,
      initialData: ConnectivityStatus.ONLINE,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: getLocal(),
        translations: AppTranslation(),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainView(),
      ),
    );
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguge();

  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else
    return Locale('fr', 'FR');
}
