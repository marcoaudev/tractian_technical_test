import 'package:tractian_technical_test/features/domain/usecases/get_locations_usecase.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/states/asset_state.dart';
import 'package:tractian_technical_test/features/ui/pages/home/home_store.dart';

class AssetPageStore extends Controllerx<AssetPageState> {
  final GetLocationUsecase usecase;

  AssetPageStore(this.usecase) : super(InitialAssetPageState());

  Future<void> fetchLocations({required String nameCompany}) async {
    emit(LoadingAssetPageState());
    final result = usecase(nameCompany);
    
    result.fold(
      (error) => emit(ErrorAssetPageState(message: error.toString())),
      (locations) => emit(SuccessAssetPageState(locations: locations)),
    );
  }
}
