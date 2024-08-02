import 'package:tractian_technical_test/features/domain/entities/location.dart';

abstract class AssetPageState{}

class InitialAssetPageState extends AssetPageState{}
class LoadingAssetPageState extends AssetPageState{}
class SuccessAssetPageState extends AssetPageState{
  List<LocationEntity> locations;

  SuccessAssetPageState({required this.locations});
}
class ErrorAssetPageState extends AssetPageState{
  final String message;

  ErrorAssetPageState({required this.message});
}
