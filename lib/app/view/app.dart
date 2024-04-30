import 'package:aidafine/app/bloc/app_bloc.dart';
import 'package:aidafine/engine/engine.dart';
import 'package:aidafine/l10n/l10n.dart';
import 'package:aidafine/router/aidafine_router.dart';
import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _appRouter = AidafineRouter();
final _firestore = FirebaseFirestore.instance;
final _fbAuth = FirebaseAuth.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return _RepositoryProvider(
      child: _BlocProvider(
        child: _BlocListener(
          child: _app,
        ),
      ),
    );
  }
}

class _RepositoryProvider extends StatelessWidget {
  const _RepositoryProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            dao: FsUserApi(
              firestore: _firestore,
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _BlocProvider extends StatelessWidget {
  const _BlocProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppBloc(),
        ),
        BlocProvider(
          create: (_) {
            final bloc = UserBloc(
              firebaseFirestore: _firestore,
              firebaseAuth: _fbAuth,
            );
            Future.delayed(const Duration(seconds: 2), () {
              bloc.add(const UserInitialize());
            });
            return bloc;
          },
          // ..add(const UserInitialize()),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}

class _BlocListener extends StatelessWidget {
  const _BlocListener({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listenWhen: (prev, curr) {
            return prev.authState != curr.authState;
          },
          listener: (context, state) {
            if (state.authState == AuthState.signedIn) {
              _appRouter
                ..popUntilRoot()
                ..replace(const RoomRoute());
            } else {
              _appRouter
                ..popUntilRoot()
                ..replace(const SignInRoute());
            }
          },
        ),
      ],
      child: child,
    );
  }
}

final _app = MaterialApp.router(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  routerConfig: _appRouter.config(),
);
