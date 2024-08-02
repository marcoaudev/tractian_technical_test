import 'package:tractian_technical_test/core/http_client/http_client.dart';
import 'package:tractian_technical_test/features/data/datasources/location_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/apex_unit.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/jaguar_unit.dart';
import 'package:tractian_technical_test/features/data/datasources/mocks/tobias_unit.dart';
import 'package:tractian_technical_test/features/data/models/location_model.dart';

class LocationDatasourceImpl implements ILocationDatasource {
  final IHttpClient client;

  LocationDatasourceImpl(this.client);

  @override
  List<LocationModel> getLocations({required String nameCompany}) {
    List locations = [];
    switch (nameCompany) {
      case "Jaguar":
        locations = Jaguar.locations
            .where((locations) => locations['parentId'] == null)
            .toList();
        break;
      case "Tobias":
        locations = Tobias.locations
            .where((locations) => locations['parentId'] == null)
            .toList();
        break;
      case "Apex":
        locations = Apex.locations
            .where((locations) => locations['parentId'] == null)
            .toList();
        break;
    }
    return locations.map((json) => LocationModel.fromJson(json)).toList();
  }

  @override
  List<LocationModel> getLocationsFromId({required String id}) {
    List locations = [];

    Jaguar.locations.forEach((location) {
      if (location['parentId'] != null && location['parentId'].contains(id)) {
        locations.add(location);
      }
    });

    Tobias.locations.forEach((location) {
      if (location['parentId'] != null && location['parentId'].contains(id)) {
        locations.add(location);
      }
    });

    Apex.locations.forEach((location) {
      if (location['parentId'] != null && location['parentId'].contains(id)) {
        locations.add(location);
      }
    });

    return locations.map((json) => LocationModel.fromJson(json)).toList();
  }
}
