import 'package:BodyPower/features/blogger/domain/use_case/blogger_use_case.dart';
import 'package:BodyPower/features/blogger/presentation/logic/bloc/blogger_bloc.dart';
import 'package:BodyPower/features/news_page/domain/use_case/news_use_case.dart';
import 'package:BodyPower/features/news_page/presentation/logic/cubit/news_cubit.dart';
import 'package:BodyPower/features/splash_screen/splash_screen.dart';
import 'package:BodyPower/features/user/domain/use_case/user_use_case.dart';
import 'package:BodyPower/features/user/presentation/logic/user_bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bottom_navigation_bar.dart';
import '../features/user/domain/use_case/authentification_use_case.dart';
import '../features/user/presentation/logic/auth_bloc/authentification_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider<BloggerUseCase>(
                create: (context) => BloggerUseCase()),
            RepositoryProvider<UserUseCase>(create: (context) => UserUseCase()),
            RepositoryProvider<AuthentificationUseCase>(
                create: (context) => AuthentificationUseCase()),
            RepositoryProvider<NewsUseCase>(create: (context) => NewsUseCase()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthentificationBloc(
                  authUseCase:
                      RepositoryProvider.of<AuthentificationUseCase>(context),
                ),
              ),
              BlocProvider(
                create: (context) => UserBloc(
                  userUseCase: RepositoryProvider.of<UserUseCase>(context),
                ),
              ),
              BlocProvider(
                create: (context) => BloggerBloc(
                  bloggerUseCase:
                      RepositoryProvider.of<BloggerUseCase>(context),
                ),
              ),
              BlocProvider(
                create: (context) => NewsCubit(
                  newsUseCase: RepositoryProvider.of<NewsUseCase>(context),
                ),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const BottomNavBar();
                  }
                  return const SplashScreen();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
