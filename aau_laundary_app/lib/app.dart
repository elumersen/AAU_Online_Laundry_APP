import 'package:aau_laundary_app/blocs/SignUp/bloc/signup_bloc.dart';
import 'package:aau_laundary_app/presentation/screens/Admin.dart';
import 'package:aau_laundary_app/presentation/screens/home.dart';
import 'package:aau_laundary_app/presentation/screens/login_page.dart';
import 'package:aau_laundary_app/presentation/screens/order2.dart';
import 'package:aau_laundary_app/presentation/screens/profile_page.dart';
import 'package:aau_laundary_app/presentation/screens/signUp_page.dart';
import 'package:aau_laundary_app/presentation/screens/updateServices.dart';
import 'package:aau_laundary_app/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'blocs/Authentication/bloc/login_bloc.dart';
import 'blocs/profile_page/bloc/profile_bloc.dart';

class App extends StatelessWidget {
  final SharedPref pref = SharedPref();
  App({
    Key? key,
  }) : super(key: key);
  // final LoginState loginState;
  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      debugLogDiagnostics: true,
      // refreshListenable: loginState.status,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'signUp',
              builder: (context, state) => const SignUpPageScreen(),
            ),
            GoRoute(
              path: 'logIn',
              builder: (context, state) => const LoginPageScreen(),
            ),
            GoRoute(
              path: 'userProfile',
              builder: (context, state) => const ProfilePage(),
            ),
            GoRoute(
              path: 'order',
              builder: (context, state) => OrderPage(),
            ),
            GoRoute(
              path: 'admin',
              builder: (context, state) => Admin(),
            ),
            GoRoute(
              path: 'serviceUpdate',
              builder: (context, state) => const AdminServiceUpdatingScreen(),
            ),
          ],
        ),
      ],
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(pref: pref)),
        BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc(pref: pref)),
      ],
      child: MaterialApp.router(
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
        debugShowCheckedModeBanner: false,
        title: "AAU Laundry Systems",
      ),
    );
  }
}
