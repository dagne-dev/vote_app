import 'package:main_project/PartyElection/data_provider/party_data.dart';
import 'package:main_project/PartyElection/models/party.dart';
import 'package:meta/meta.dart';

class PartyRepository {
  final PartyDataProvider dataProvider;

  PartyRepository({@required this.dataProvider}) : assert(dataProvider != null);

  Future<Party> createParty(Party party) async {
    return await dataProvider.createParty(party);
  }

  Future<List<Party>> getParties() async {
    return await dataProvider.getParties();
  }

  Future<void> updateParty(Party party) async {
    await dataProvider.updateParty(party);
  }

  Future<void> deleteParty(int id) async {
    await dataProvider.deleteParty(id);
  }
}
