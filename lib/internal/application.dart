import 'package:BodyPower/features/user/presentation/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/user/domain/use_case/authentification_use_case.dart';
import '../features/user/presentation/logic/auth_bloc/authentification_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return RepositoryProvider(
          create: (context) => AuthentificationUseCase(),
          child: BlocProvider(
              create: (context) => AuthentificationBloc(
                    authUseCase:
                        RepositoryProvider.of<AuthentificationUseCase>(context),
                  ),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return const BottomAppBar();
                      }
                      return const WelcomeScreen();
                    }),
              )),
        );
      },
    );
  }
}
