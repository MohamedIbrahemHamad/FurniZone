import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furnizone/Constant/SizeConfg.dart';
import 'package:furnizone/Constant/routes.dart';
import 'package:furnizone/Data/APIs/Dio_Consumer.dart';
import 'package:furnizone/Data/cache/cache_helper.dart';
import 'package:furnizone/Logic/AdminCubit/admin_cubit.dart';
import 'package:furnizone/Logic/AuthCubit/auth_cubit.dart';
import 'package:furnizone/Logic/cart_cubit/cart_cubit.dart';
import 'package:furnizone/Logic/details_cubit/details_cubit.dart';
import 'package:furnizone/Logic/home_cubit/home_cubit.dart';
import 'package:furnizone/Logic/nav/category_cubit.dart';
import 'package:furnizone/Logic/nav/favorite_cubit.dart';
import 'package:furnizone/Logic/nav/navigation_cubit.dart';
import 'package:furnizone/Logic/profile_cubit/profile_cubit.dart';
import 'package:furnizone/Logic/wish_cubit/wish_cubit.dart';
import 'package:furnizone/Presentation/Pages/AuthPages/GetStartedPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const FurniZone());
}

class FurniZone extends StatelessWidget {
  const FurniZone({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(api: DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (context) => AdminCubit(api: DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (BuildContext context) => CartCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ProfileCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => WishCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              DetailsCubit(DioConsumer(dio: Dio())),
        ),
      ],
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
