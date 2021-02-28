import 'package:main_project/ElectionInfo/election_info.dart';
import 'package:meta/meta.dart';

class ElectionRepository {
  final ElectionDataProvider dataProvider;

  ElectionRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Election> createElection(Election election) async {
    return await dataProvider.createElection(election);
  }

  Future<List<Election>> getElections() async {
    return await dataProvider.getElections();
  }

  Future<void> updateElection(Election election) async {
    await dataProvider.updateElection(election);
  }

  Future<void> deleteElection(int id) async {
    await dataProvider.deleteElection(id);
  }
}
