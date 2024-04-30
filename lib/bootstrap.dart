import 'dart:async';
import 'dart:developer';

import 'package:aidafine/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory(),
      );

      await Firebase.initializeApp(
        options:
            DefaultFirebaseOptions.currentPlatform(Environment.development),
      );

      // final host = Platform.isAndroid ? '127.0.0.1' : 'localhost';
      // FirebaseFunctions.instanceFor(region: 'us-central1')
      //     .useFunctionsEmulator(host, 5001);

      // FirebaseMessaging.onBackgroundMessage(
      //   _fcmBgHandler,
      // );

      // if (!kIsWeb && !Platform.isIOS) {
      //   await setupFlutterNotifications();
      // }

      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
