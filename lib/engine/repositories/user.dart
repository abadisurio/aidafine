import 'package:aidafine/engine/engine.dart';

class UserRepository {
  const UserRepository({
    required UserDAO dao,
  }) : _dao = dao;

  final UserDAO _dao;

  Future<Pilot> getUser({required String id}) async {
    return _dao.getPreview(id: id);
  }
}
