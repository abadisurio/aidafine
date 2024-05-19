import 'package:aidafine/engine/engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FsUserApi implements UserDAO {
  /// {@macro firestore_calendar_api}
  FsUserApi({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<void> create({required Pilot user}) {
    // final doc = _firestore.doc(FirestorePaths.pilots);

    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Pilot> getDetail({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Pilot> getPreview({required String id}) async {
    final docRef = _firestore.collection(FirestorePaths.pilots);
    final snapshot = await docRef.where('username', isEqualTo: id).get();
    if (snapshot.docs.isEmpty) {
      throw Exception('User not found');
    }
    final data = snapshot.docs.first.data();

    return Pilot.fromJson({'id': snapshot.docs.first.id, ...data});
  }
  // abadisurio

  @override
  Future<Pilot> update({required Pilot user}) {
    throw UnimplementedError();
  }
}
