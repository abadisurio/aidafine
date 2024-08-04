import 'package:aidafine/app/bloc/app_bloc.dart';
import 'package:aidafine/app/themes/themes.dart';
import 'package:aidafine/engine/engine.dart';
import 'package:aidafine/l10n/l10n.dart';
import 'package:aidafine/router/aidafine_router.dart';
import 'package:aidafine/shared/blocs/blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final _appRouter = AidafineRouter();
final _firestore = FirebaseFirestore.instance;
final _fbAuth = FirebaseAuth.instance;

final appCurrencyFormat = NumberFormat.currency(
  locale: 'id_ID',
  name: 'Rp',
  decimalDigits: 0,
);

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
          create: (_) => GeminiBloc(),
        ),
        BlocProvider(
          create: (_) => GeminiVoiceBloc(),
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
                ..replace(const MainRoute());
            } else {
              _appRouter
                ..popUntilRoot()
                ..replace(const SignInRoute());
            }
          },
        ),
        BlocListener<GeminiVoiceBloc, GeminiVoiceState>(
          listenWhen: (prev, curr) {
            return prev.isGeneratingAnswer && !curr.isGeneratingAnswer;
          },
          listener: (context, state) {
            if (state.pushNamedRoute != null) {
              switch (state.pushNamedRoute!) {
                case QRISRoute.name:
                  _appRouter.push(
                    QRISRoute(amount: int.tryParse('${state.data}')),
                  );
                default:
              }
            }
          },
        ),
        BlocListener<GeminiBloc, GeminiState>(
          listenWhen: (prev, curr) {
            return prev.isGeneratingAnswer && !curr.isGeneratingAnswer;
          },
          listener: (context, state) {
            if (state.pushNamedRoute != null) {
              switch (state.pushNamedRoute!) {
                case QRISRoute.name:
                  _appRouter.push(
                    QRISRoute(amount: state.data as int?),
                  );
                default:
              }
            }
          },
        ),
      ],
      child: child,
    );
  }
}

// class _Overlays extends StatelessWidget {
//   const _Overlays({required this.child});

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       child,
//     ],);
//   }
// }

final _app = MaterialApp.router(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  routerConfig: _appRouter.config(),
  theme: lightTheme,
  darkTheme: darkTheme,
);

extension BuildContextEntension<T> on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get screenPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get screenInset => MediaQuery.of(this).viewInsets;

  Size get size => MediaQuery.of(this).size;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ColorBrightness on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1, 'Amount must be between 0 and 1');

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Brightness get getTextColorTheme {
    return (computeLuminance() > 0.179) ? Brightness.light : Brightness.dark;
  }
}
