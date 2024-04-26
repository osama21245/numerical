// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewtonModel {
  final int index;
  final double xi;
  final double fxi;
  final double fxidash;
  final double erorr;
  NewtonModel({
    required this.index,
    required this.xi,
    required this.fxi,
    required this.fxidash,
    required this.erorr,
  });

  NewtonModel copyWith({
    int? index,
    double? xi,
    double? fxi,
    double? fxidash,
    double? erorr,
  }) {
    return NewtonModel(
      index: index ?? this.index,
      xi: xi ?? this.xi,
      fxi: fxi ?? this.fxi,
      fxidash: fxidash ?? this.fxidash,
      erorr: erorr ?? this.erorr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'xi': xi,
      'fxi': fxi,
      'fxidash': fxidash,
      'erorr': erorr,
    };
  }

  factory NewtonModel.fromMap(Map<String, dynamic> map) {
    return NewtonModel(
      index: map['index'] as int,
      xi: map['xi'] as double,
      fxi: map['fxi'] as double,
      fxidash: map['fxidash'] as double,
      erorr: map['erorr'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewtonModel.fromJson(String source) =>
      NewtonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewtonModel(index: $index, xi: $xi, fxi: $fxi, fxidash: $fxidash, erorr: $erorr)';
  }

  @override
  bool operator ==(covariant NewtonModel other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.xi == xi &&
        other.fxi == fxi &&
        other.fxidash == fxidash &&
        other.erorr == erorr;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        xi.hashCode ^
        fxi.hashCode ^
        fxidash.hashCode ^
        erorr.hashCode;
  }
}
