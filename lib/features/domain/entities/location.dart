

import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable{
  final String name;
  final String parentId;

  const LocationEntity({required this.name, required this.parentId});
  @override
  
  List<Object?> get props =>[name];
}