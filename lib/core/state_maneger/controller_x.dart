import 'package:flutter/material.dart';

abstract class Controllerx<T> extends ValueNotifier<T>{
  Controllerx(super.value);

  emit(T state){
    super.value = state;
  }
}