import 'package:flutter/material.dart';

extension Mysize on int {
  SizedBox get h => SizedBox(
    height: toDouble(),
  );
  SizedBox get w => SizedBox(
    width: toDouble(),
  );
}

extension MyText on String{
  String get tcase => replaceFirst(
    this[0],
    this[0].toUpperCase(),
  );    
}