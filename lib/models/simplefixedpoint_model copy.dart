// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SecantModel {
  final int index;
  final double xi;
  final double ximinus;
  final double fxi;
  final double fximinus;
  final double erorr;
  SecantModel({
    required this.index,
    required this.xi,
    required this.ximinus,
    required this.fxi,
    required this.fximinus,
    required this.erorr,
  });

  SecantModel copyWith({
    int? index,
    double? xi,
    double? ximinus,
    double? fxi,
    double? fximinus,
    double? erorr,
  }) {
    return SecantModel(
      index: index ?? this.index,
      xi: xi ?? this.xi,
      ximinus: ximinus ?? this.ximinus,
      fxi: fxi ?? this.fxi,
      fximinus: fximinus ?? this.fximinus,
      erorr: erorr ?? this.erorr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'xi': xi,
      'ximinus': ximinus,
      'fxi': fxi,
      'fximinus': fximinus,
      'erorr': erorr,
    };
  }

  factory SecantModel.fromMap(Map<String, dynamic> map) {
    return SecantModel(
      index: map['index'] as int,
      xi: map['xi'] as double,
      ximinus: map['ximinus'] as double,
      fxi: map['fxi'] as double,
      fximinus: map['fximinus'] as double,
      erorr: map['erorr'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SecantModel.fromJson(String source) =>
      SecantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SecantModel(index: $index, xi: $xi, ximinus: $ximinus, fxi: $fxi, fximinus: $fximinus, erorr: $erorr)';
  }

  @override
  bool operator ==(covariant SecantModel other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.xi == xi &&
        other.ximinus == ximinus &&
        other.fxi == fxi &&
        other.fximinus == fximinus &&
        other.erorr == erorr;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        xi.hashCode ^
        ximinus.hashCode ^
        fxi.hashCode ^
        fximinus.hashCode ^
        erorr.hashCode;
  }
}
