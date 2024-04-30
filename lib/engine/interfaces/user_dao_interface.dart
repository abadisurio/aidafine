import 'package:aidafine/engine/engine.dart';

abstract class UserDAO {
  const UserDAO();

  Future<void> create({required Pilot user});
  Future<void> delete({required String id});
  Future<Pilot> update({required Pilot user});
  Future<Pilot> getDetail({required String id});
  Future<Pilot> getPreview({required String id});
}
