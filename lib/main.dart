import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Constant/routes.dart';
import 'package:furnizone/Presentation/Pages/GetStartedPage.dart';

void main() => runApp(const FurniZone());

class FurniZone extends StatelessWidget {
  const FurniZone({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.initialization(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: GetStarted.Id,
          routes: MyRoutes,
        );
      },
    );
  }
}
