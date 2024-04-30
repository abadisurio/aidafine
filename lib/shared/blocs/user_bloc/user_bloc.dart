import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:aidafine/engine/engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';
part 'user_bloc.g.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth,
        super(const UserState()) {
    _userCol = firebaseFirestore.collection(FirestorePaths.pilots);

    on<UserInitialize>(_onUserInitialize);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<RefreshOrbyteUser>(_onRefreshOrbyteUser);
    on<SignOut>(_onSignOut);
  }

  static const _keyStoredGoogleUser = 'stored_google_user';
  static const _keyStoredOrbyteUser = 'stored_orbyte_user';

  static const _storage = FlutterSecureStorage();
  static const _secureStorageAndroidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // FirebaseFirestore _firebaseFirestore;
  OAuthCredential? _currentCredential;
  Pilot? _remoteUser;
  // Pilot? _localUser;
  Pilot? _currentOrbyteUser;
  User? _curentUser;
  late DocumentReference _userDoc;
  late CollectionReference _userCol;
  final FirebaseAuth _firebaseAuth;
  final _googleSignIn = GoogleSignIn();

  Future<void> _onUserInitialize(
    UserInitialize event,
    Emitter<UserState> emit,
  ) async {
    log('state auth ${state.authState}');
    // if (state.authState != AuthState.signedIn) {
    //   emit(state.copyWith(authState: AuthState.signedOut));
    //   return;
    // }
    // await _storage.delete(
    //   key: _keyStoredOrbyteUser,
    //   aOptions: _secureStorageAndroidOptions,
    // );
    // await _storage.delete(
    //   key: _keyStoredGoogleUser,
    //   aOptions: _secureStorageAndroidOptions,
    // );
    await _initializeLocalCredential();
    log('_currentCredential $_currentCredential');
    if (_currentCredential != null) {
      await _initializeUserData();
      emit(
        state.copyWith(
          authState: AuthState.signedIn,
          user: _currentOrbyteUser,
        ),
      );
    } else {
      emit(state.copyWith(authState: AuthState.signedOut));
    }
  }

  Future<void> _initializeLocalCredential() async {
    final credential = await _storage.read(
      key: _keyStoredGoogleUser,
      aOptions: _secureStorageAndroidOptions,
    );
    if (credential != null) {
      final credentialJson = json.decode(credential) as Map;
      final providerId = credentialJson['providerId'] as String?;
      final signInMethod = credentialJson['signInMethod'] as String?;
      final accessToken = credentialJson['accessToken'] as String?;
      if (providerId != null && signInMethod != null && accessToken != null) {
        _currentCredential = OAuthCredential(
          providerId: providerId,
          signInMethod: signInMethod,
          accessToken: accessToken,
        );
        // add(const UserInitialize());
      }
    }

    // if (currentUser == null) {
    // }
  }

  Future<void> _initializeUserData() async {
    _curentUser = _firebaseAuth.currentUser;
    _userDoc = _userCol.doc(_curentUser!.uid);

    // _localUser = await _readFromStorage();
    _remoteUser = await _readFromFirestore();

    // log('_localUser $_localUser');
    log('_localUser ${state.user}');
    log('_remoteUser $_remoteUser');
    final user = _remoteUser ?? state.user;
    if (state.user != null && _remoteUser == null) {
      await _createNewUserToFirestore();
    }
    if (state.user == null && _remoteUser != null) {
      await _readFromFirestore();
    }
    _currentOrbyteUser = user ?? await _createNewUserToFirestore();
    log('_currentOrbyteUser2 $_currentOrbyteUser');
    // add(const RefreshOrbyteUser());
  }

  Future<void> _signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _storage.write(
        key: _keyStoredGoogleUser,
        value: json.encode(credential.asMap()),
        aOptions: _secureStorageAndroidOptions,
      );
      await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(authState: AuthState.loading));

    await _signInWithGoogle();
    await _initializeUserData();

    log('_currentOrbyteUser $_currentOrbyteUser');

    emit(
      state.copyWith(
        authState: AuthState.signedIn,
        user: _currentOrbyteUser,
      ),
    );
    //
  }

  Future<Pilot?> _readFromFirestore() async {
    final snapshot = await _userDoc.get();
    final remoteData = snapshot.data() as Map<String, dynamic>?;

    // log('snapshot $remoteData');
    if (snapshot.exists) {
      return Pilot.fromJson({
        'id': _userDoc.id,
        ...remoteData ?? {},
      });
    }
    return null;
  }

  Future<void> _writeToFirestore(Pilot orbyteUser) async {
    log('orbyteUser2 $orbyteUser');
    await _userDoc.set(
      orbyteUser.toJson()..remove('id'),
      SetOptions(merge: true),
    );
  }

  // Future<Pilot?> _readFromStorage() async {
  //   final orbyteUserString = await _storage.read(
  //     key: _keyStoredOrbyteUser,
  //     aOptions: _secureStorageAndroidOptions,
  //   );
  //   if (orbyteUserString != null) {
  //     return Pilot.fromJson(
  //       json.decode(orbyteUserString) as Map<String, dynamic>,
  //     );
  //   }
  //   return null;
  // }

  Future<Pilot> _createNewUserToFirestore() async {
    final id = _firebaseAuth.currentUser!.uid;
    final newPilot = Pilot(
      id: id,
      createdAt: DateTime.now(),
      username: id,
      photoUrl: _firebaseAuth.currentUser?.photoURL,
    );
    await _writeToFirestore(newPilot);
    return newPilot;
  }

  Future<void> _onRefreshOrbyteUser(
    RefreshOrbyteUser event,
    Emitter<UserState> emit,
  ) async {
    // final fcmToken = await FirebaseMessaging.instance.getToken();
    if (event.newOrbyteUser != null) {
      _currentOrbyteUser = event.newOrbyteUser;
    }
    if (_curentUser != null && _currentOrbyteUser != null) {
      _currentOrbyteUser = _currentOrbyteUser!.copyWith(
        // fcmToken: fcmToken,
        photoUrl: _curentUser?.photoURL,
        modifiedAt: DateTime.now(),
      );

      unawaited(_writeToFirestore(_currentOrbyteUser!));

      emit(state.copyWith(user: _currentOrbyteUser));
    }
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(authState: AuthState.loading));
    await _googleSignIn.signOut();
    // await FirebaseMessaging.instance.deleteToken();
    await _storage.delete(
      key: _keyStoredOrbyteUser,
      aOptions: _secureStorageAndroidOptions,
    );
    await _storage.delete(
      key: _keyStoredGoogleUser,
      aOptions: _secureStorageAndroidOptions,
    );
    await _firebaseAuth.signOut();
    emit(state.copyWith(authState: AuthState.signedOut));
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
    // return null;
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    log('state ${state.user}');
    return state.toJson();
  }
}
