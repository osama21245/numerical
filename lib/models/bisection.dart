// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BisectionModel {
  final List<double> xl;
  final List<double> fxl;
  final List<double> xu;
  final List<double> fxu;
  final List<double> listxr;
  final List<double> fxr;
  final List<double> listerorr;
  BisectionModel({
    required this.xl,
    required this.fxl,
    required this.xu,
    required this.fxu,
    required this.listxr,
    required this.fxr,
    required this.listerorr,
  });

  BisectionModel copyWith({
    List<double>? xl,
    List<double>? fxl,
    List<double>? xu,
    List<double>? fxu,
    List<double>? listxr,
    List<double>? fxr,
    List<double>? listerorr,
  }) {
    return BisectionModel(
      xl: xl ?? this.xl,
      fxl: fxl ?? this.fxl,
      xu: xu ?? this.xu,
      fxu: fxu ?? this.fxu,
      listxr: listxr ?? this.listxr,
      fxr: fxr ?? this.fxr,
      listerorr: listerorr ?? this.listerorr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'xl': xl,
      'fxl': fxl,
      'xu': xu,
      'fxu': fxu,
      'listxr': listxr,
      'fxr': fxr,
      'listerorr': listerorr,
    };
  }

  factory BisectionModel.fromMap(Map<String, dynamic> map) {
    return BisectionModel(
      xl: List<double>.from((map['xl'] as List<double>)),
      fxl: List<double>.from((map['fxl'] as List<double>)),
      xu: List<double>.from((map['xu'] as List<double>)),
      fxu: List<double>.from((map['fxu'] as List<double>)),
      listxr: List<double>.from((map['listxr'] as List<double>)),
      fxr: List<double>.from((map['fxr'] as List<double>)),
      listerorr: List<double>.from((map['listerorr'] as List<double>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory BisectionModel.fromJson(String source) =>
      BisectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BisectionModel(xl: $xl, fxl: $fxl, xu: $xu, fxu: $fxu, listxr: $listxr, fxr: $fxr, listerorr: $listerorr)';
  }

  @override
  bool operator ==(covariant BisectionModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.xl, xl) &&
        listEquals(other.fxl, fxl) &&
        listEquals(other.xu, xu) &&
        listEquals(other.fxu, fxu) &&
        listEquals(other.listxr, listxr) &&
        listEquals(other.fxr, fxr) &&
        listEquals(other.listerorr, listerorr);
  }

  @override
  int get hashCode {
    return xl.hashCode ^
        fxl.hashCode ^
        xu.hashCode ^
        fxu.hashCode ^
        listxr.hashCode ^
        fxr.hashCode ^
        listerorr.hashCode;
  }
}
