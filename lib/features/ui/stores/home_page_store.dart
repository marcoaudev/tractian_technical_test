import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_technical_test/features/ui/states/home_page_state.dart';

class HomePageStore extends ValueNotifier<HomePageState> {
  final GetCompanyUsecase usecase;

  HomePageStore(this.usecase) : super(InitialHomePageState());

  Future<void> fetchCompanies() async {
    value = LoadingHomePageState();
    final result = await usecase();
    result.fold(
      (error) => value = ErrorHomePageState(message: "error"),
      (companies) => value = SuccessHomePageState(companies: companies),
    );
  }
}
