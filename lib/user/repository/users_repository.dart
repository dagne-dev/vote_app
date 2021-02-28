// import 'package:main_project/PartyElection/data_provider/party_data.dart';
import 'package:main_project/user/data_provider/user_data.dart';
import 'package:main_project/user/model/user.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<User> createUser(User user) async {
    return await dataProvider.createUser(user);
  }

  Future<List<User>> getUsers() async {
    return await dataProvider.getUsers();
  }

  Future<void> updateUser(User user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    await dataProvider.deleteUser(id);
  }
}
