

import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable{
  final String name;

  const CompanyEntity({required this.name});
  @override
  
  List<Object?> get props =>[name];

}