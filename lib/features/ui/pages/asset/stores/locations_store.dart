import 'package:tractian_technical_test/features/domain/entities/location.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_locations_from_id_usecase.dart';

class LocationStore {
  final GetLocationFromIdUsecase usecase;

  LocationStore(this.usecase);

  List<LocationEntity> fetchLocationFromId({required String id}){
  
    final result = usecase(id);
    List<LocationEntity> locations = [];

    result.fold(
      (_) {},
      (r) {
        locations = r;
        return locations;
      },
    );

    return locations;
  }
}
