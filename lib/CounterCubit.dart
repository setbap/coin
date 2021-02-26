import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Counter extends Equatable {
  final int value;

  Counter({@required this.value});

  @override
  List<Object> get props => [value];
}
