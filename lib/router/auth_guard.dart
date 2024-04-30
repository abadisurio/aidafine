import 'package:aidafine/router/aidafine_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AidafineGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      resolver.next();
    } else {
      router.push(const SignInRoute());
    }
  }
}
