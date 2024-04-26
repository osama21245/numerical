// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SimpleFixedPointModel {
  final int index;
  final double xi;
  final double xiPlus1;
  final double erorr;
  SimpleFixedPointModel({
    required this.index,
    required this.xi,
    required this.xiPlus1,
    required this.erorr,
  });

  SimpleFixedPointModel copyWith({
    int? index,
    double? xi,
    double? xiPlus1,
    double? erorr,
  }) {
    return SimpleFixedPointModel(
      index: index ?? this.index,
      xi: xi ?? this.xi,
      xiPlus1: xiPlus1 ?? this.xiPlus1,
      erorr: erorr ?? this.erorr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'xi': xi,
      'xiPlus1': xiPlus1,
      'erorr': erorr,
    };
  }

  factory SimpleFixedPointModel.fromMap(Map<String, dynamic> map) {
    return SimpleFixedPointModel(
      index: map['index'] as int,
      xi: map['xi'] as double,
      xiPlus1: map['xiPlus1'] as double,
      erorr: map['erorr'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleFixedPointModel.fromJson(String source) =>
      SimpleFixedPointModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SimpleFixedPointModel(index: $index, xi: $xi, xiPlus1: $xiPlus1, erorr: $erorr)';
  }

  @override
  bool operator ==(covariant SimpleFixedPointModel other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.xi == xi &&
        other.xiPlus1 == xiPlus1 &&
        other.erorr == erorr;
  }

  @override
  int get hashCode {
    return index.hashCode ^ xi.hashCode ^ xiPlus1.hashCode ^ erorr.hashCode;
  }
}
