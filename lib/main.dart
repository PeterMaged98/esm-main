import 'package:easy_localization/easy_localization.dart';
import 'package:esm/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/request_quotation_screen.dart';
import 'package:esm/features/price_feature/presentation/presentation_logic_holder/price_cubit.dart';
import 'package:esm/features/price_feature/presentation/screens/home_company_screen.dart';
import 'package:esm/features/price_feature/presentation/screens/under_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/utils/bloc_observer.dart';
import 'app/utils/get_it_injection.dart';
import 'app/utils/language_manager.dart';
import 'app/utils/navigation_helper.dart';
import 'app/widgets/carousel_widget/carousel_cubit/carousel_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await init();
  runApp(  MultiBlocProvider(
    providers: [
      BlocProvider<CarouselCubit>(
        create: (BuildContext context) => CarouselCubit(),
      ),
      BlocProvider<PriceCubit>(
        create: (BuildContext context) => PriceCubit(),
      ),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        english_local,
        arabic_local,
      ],
      path: assets_path_localisations,
      fallbackLocale: english_local,
      //
      //* OverlaySupport
      //
      child: OverlaySupport.global(
        //
        //* ScreenUtilInit
        //
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          //
          //* MaterialApp
          //
          builder: (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            // locale: CookieManagerService.getLocale,
            locale: context.locale,
            title: 'Waradly',
            theme: ThemeData(
              fontFamily: "Montserrat",
              scaffoldBackgroundColor: Colors.white
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<NavHelper>().navigatorKey,
            //
            //* EasyLoading
            //
            builder: EasyLoading.init(
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
            ),
            // home: getIt<CacheService>().getOnBoarding() == null
            //     ? const OnBoardingScreen()
            //     : const
            home: const LoginScreen(),
          ),
        ),
      ),
    );
  }
}