import 'package:flutter/material.dart';
import 'package:tractian_technical_test/core/http_client/dio_implematation.dart';
import 'package:tractian_technical_test/features/data/datasources/company_datasource_impl.dart';
import 'package:tractian_technical_test/features/data/repositories/company_repository.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_technical_test/features/ui/states/home_page_state.dart';
import 'package:tractian_technical_test/features/ui/stores/home_page_store.dart';
import 'package:tractian_technical_test/features/ui/widgets/item_company.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageStore = HomePageStore(GetCompanyUsecase(
      CompanyRepositoryImpl(CompanyDatasourceImpl(DioImplematation()))));

  @override
  void initState() {
    super.initState();
    homePageStore.fetchCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 30,
          child: Image.asset('assets/tractian_logo.png'),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: homePageStore,
        builder: (context, value, child) {
          if (value is SuccessHomePageState) {
            final companies = value.companies;
            child = ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index){
                return ItemCompanyWidget(company: companies[index]);
              }
            );
          }

          if (value is ErrorHomePageState) {
            child = Text("Error");
          }

          if (value is LoadingHomePageState) {
            child = Text("Carregando");
          }

          return child!;
        },
      ),
    );
  }
}
