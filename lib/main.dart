import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handy_helper_main/auth/pages/partner_type.dart';
import 'package:handy_helper_main/auth/pages/user_info_page.dart';
import 'package:handy_helper_main/auth/pages/user_type.dart';
import 'package:handy_helper_main/auth/pages/login_page.dart';
import 'package:handy_helper_main/auth/pages/otp_page.dart';
import 'package:handy_helper_main/common/routes/routes.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/helpers/show_dialogue.dart';
import 'package:handy_helper_main/home/customer/pages/homescreen.dart';
import 'package:handy_helper_main/welcome/pages/welcome.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.grey);

  static final defaultDarkColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.grey);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return DynamicColorBuilder(
              builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              title: 'ToDo App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: AppConst.kBkDark,
                colorScheme: lightColorScheme ?? defaultLightColorScheme,
                useMaterial3: true,
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: AppConst.kBkDark,
                colorScheme: lightColorScheme ?? defaultLightColorScheme,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              home: OnBoarding(),
              // home: NotificationPage(),
              onGenerateRoute: Routes.onGenerateRoute,
              // home: const TestPage(),
              // home: UHomeScreen(),
            );
          });
        });
  }
}
