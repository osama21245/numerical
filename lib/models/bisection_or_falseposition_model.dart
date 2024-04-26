// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BisectionModal {
  final int index;
  final double xl;
  final double fxl;
  final double xu;
  final double fxu;
  final double listxr;
  final double fxr;
  final double listerorr;
  BisectionModal({
    required this.index,
    required this.xl,
    required this.fxl,
    required this.xu,
    required this.fxu,
    required this.listxr,
    required this.fxr,
    required this.listerorr,
  });

  BisectionModal copyWith({
    int? index,
    double? xl,
    double? fxl,
    double? xu,
    double? fxu,
    double? listxr,
    double? fxr,
    double? listerorr,
  }) {
    return BisectionModal(
      index: index ?? this.index,
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
      'index': index,
      'xl': xl,
      'fxl': fxl,
      'xu': xu,
      'fxu': fxu,
      'listxr': listxr,
      'fxr': fxr,
      'listerorr': listerorr,
    };
  }

  factory BisectionModal.fromMap(Map<String, dynamic> map) {
    return BisectionModal(
      index: map['index'] as int,
      xl: map['xl'] as double,
      fxl: map['fxl'] as double,
      xu: map['xu'] as double,
      fxu: map['fxu'] as double,
      listxr: map['listxr'] as double,
      fxr: map['fxr'] as double,
      listerorr: map['listerorr'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory BisectionModal.fromJson(String source) =>
      BisectionModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BisectionModal(index: $index, xl: $xl, fxl: $fxl, xu: $xu, fxu: $fxu, listxr: $listxr, fxr: $fxr, listerorr: $listerorr)';
  }

  @override
  bool operator ==(covariant BisectionModal other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.xl == xl &&
        other.fxl == fxl &&
        other.xu == xu &&
        other.fxu == fxu &&
        other.listxr == listxr &&
        other.fxr == fxr &&
        other.listerorr == listerorr;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        xl.hashCode ^
        fxl.hashCode ^
        xu.hashCode ^
        fxu.hashCode ^
        listxr.hashCode ^
        fxr.hashCode ^
        listerorr.hashCode;
  }
}
