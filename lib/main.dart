import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_technical_test/app_widget.dart';
import 'package:tractian_technical_test/core/http_client/dio_implematation.dart';
import 'package:tractian_technical_test/core/http_client/http_client.dart';
import 'package:tractian_technical_test/features/data/datasources/asset_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/asset_datasource_impl.dart';
import 'package:tractian_technical_test/features/data/datasources/company_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/company_datasource_impl.dart';
import 'package:tractian_technical_test/features/data/datasources/component_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/component_datasource_impl.dart';
import 'package:tractian_technical_test/features/data/datasources/location_datasource.dart';
import 'package:tractian_technical_test/features/data/datasources/location_datasource_impl.dart';
import 'package:tractian_technical_test/features/data/repositories/asset_repository.dart';
import 'package:tractian_technical_test/features/data/repositories/company_repository.dart';
import 'package:tractian_technical_test/features/data/repositories/component_repository.dart';
import 'package:tractian_technical_test/features/data/repositories/location_repository.dart';
import 'package:tractian_technical_test/features/domain/repositories/asset_repository_interface.dart';
import 'package:tractian_technical_test/features/domain/repositories/company_repository_interface.dart';
import 'package:tractian_technical_test/features/domain/repositories/component_repository.dart';
import 'package:tractian_technical_test/features/domain/repositories/location_repository_interface.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_assets_from_asset_id_usecase.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_assets_from_id_usecase.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_components_from_asset_id.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_locations_from_id_usecase.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_locations_usecase.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/asset_page_store.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/assets_store.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/components_store.dart';
import 'package:tractian_technical_test/features/ui/pages/asset/stores/locations_store.dart';
import 'package:tractian_technical_test/features/ui/pages/home/home_store.dart';

void main() {
  return runApp(
      MultiProvider(
        providers: [
          Provider<IHttpClient>(create: (context) => DioImplematation()),
          Provider<ICompanyDatasource>(create: (context) => CompanyDatasourceImpl(context.read())),
          Provider<ICompanyRepository>(create: (context) => CompanyRepositoryImpl(context.read())),
          Provider(create: (context) => GetCompanyUsecase(context.read())),
          ChangeNotifierProvider(create: (context) => HomeStore(context.read())),
          Provider<ILocationDatasource>(create: (context) => LocationDatasourceImpl(context.read())),
          Provider<ILocationRepository>(create: (context) => LocationRepositoryImpl(context.read())),
          Provider(create: (context) => GetLocationUsecase(context.read())),
          Provider(create: (context) => GetLocationFromIdUsecase(context.read())),
          ChangeNotifierProvider(create: (context) => AssetPageStore(context.read()),),
          Provider(create: (context) => LocationStore(context.read()),),
          Provider<IAssetDatasource>(create: (context) => AssetDatasourceImpl(context.read())),
          Provider<IAssetRepository>(create: (context) => AssetRepositoryImpl(context.read())),
          Provider(create: (context) => GetAssetFromLocationIdUsecase(context.read())),
          Provider(create: (context) => GetAssetFromAssetIdUsecase(context.read())),
          Provider(create: (context) => AssetsStore(context.read(), context.read()),),
          Provider<IComponentDatasource>(create: (context) => ComponentDatasourceImpl()),
          Provider<IComponentRepository>(create: (context) => ComponentRepositoryImpl(context.read())),
          Provider(create: (context) => GetComponentsFromAssetIdUsecase(context.read())),
          Provider(create: (context) => ComponentsStore(context.read()),),
        ],
        child: const AppWidget(),
      )
  );
}
