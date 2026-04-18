import 'package:clean_arc/core/routes/navigator_push.dart';
import 'package:clean_arc/core/theme/light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      theme: themeDataLight(),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 600, name: MOBILE),
            const Breakpoint(start: 601, end: 1200, name: TABLET),
            const Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
          ],
          child: Builder(
            builder: (responsiveContext) {
              return ResponsiveScaledBox(
                width: ResponsiveValue<double?>(
                  responsiveContext,
                  conditionalValues: [
                    const Condition.equals(name: MOBILE, value: 400),
                    const Condition.equals(name: TABLET, value: 800),
                    const Condition.largerThan(name: TABLET, value: 1000),
                  ],
                ).value,
                child: child!,
              );
            },
          ),
        );
      },
      home: Scaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
