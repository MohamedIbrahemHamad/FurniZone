import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Constant/routes.dart';
import 'package:furnizone/Data/APIs/Dio_Consumer.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Presentation/Pages/GetStartedPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(const FurniZone());

class FurniZone extends StatelessWidget {
  const FurniZone({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(api: DioConsumer(dio: Dio())),
      child: LayoutBuilder(
        builder: (context, constraints) {
          SizeConfig.initialization(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: GetStarted.Id,
            routes: MyRoutes,
          );
        },
      ),
    );
  }
}
