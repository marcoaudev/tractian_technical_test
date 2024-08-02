

import 'package:tractian_technical_test/features/domain/entities/component.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_components_from_asset_id.dart';

class ComponentsStore {
  final GetComponentsFromAssetIdUsecase usecase;

  ComponentsStore(this.usecase);

  List<ComponentEntity> fetchComponentsFromAssetId({required String id}){
  
    final result = usecase(id);
    List<ComponentEntity> components = [];

    result.fold(
      (_) {},
      (r) {
        components = r;
        return components;
      },
    );

    return components;
  }
}
