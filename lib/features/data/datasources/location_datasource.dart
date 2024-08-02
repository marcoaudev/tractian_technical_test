import 'package:tractian_technical_test/features/data/models/location_model.dart';

abstract interface class ILocationDatasource{
  List<LocationModel> getLocations({required String nameCompany});
  List<LocationModel> getLocationsFromId({required String id});
}