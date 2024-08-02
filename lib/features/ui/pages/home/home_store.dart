import 'package:flutter/material.dart';
import 'package:tractian_technical_test/features/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_technical_test/features/ui/pages/home/home_state.dart';

class HomeStore extends Controllerx<HomePageState> {
  final GetCompanyUsecase usecase;

  HomeStore(this.usecase) : super(InitialHomePageState());

  Future<void> fetchCompanies() async {
    emit(LoadingHomePageState());
    final result = await usecase();
    
    result.fold(
      (error) => emit(ErrorHomePageState(message: error.toString())),
      (companies) => emit(SuccessHomePageState(companies: companies)),
    );
  }
}

abstract class Controllerx<T> extends ValueNotifier<T>{
  Controllerx(super.value);

  emit(T state){
    super.value = state;
  }
}