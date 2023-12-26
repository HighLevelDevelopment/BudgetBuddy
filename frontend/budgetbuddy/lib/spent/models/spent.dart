// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Spent {
  final int idSpent;
  final String description;
  final String category;
  final String type;
  final double spentAmount;
  Spent({
    required this.idSpent,
    required this.description,
    required this.category,
    required this.type,
    required this.spentAmount,
  });
  
  Spent copyWith({
    int? idSpent,
    String? description,
    String? category,
    String? type,
    double? spentAmount,
  }) {
    return Spent(
      idSpent: idSpent ?? this.idSpent,
      description: description ?? this.description,
      category: category ?? this.category,
      type: type ?? this.type,
      spentAmount: spentAmount ?? this.spentAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idSpent': idSpent,
      'description': description,
      'category': category,
      'type': type,
      'spentAmount': spentAmount,
    };
  }

  factory Spent.fromMap(Map<String, dynamic> map) {
    return Spent(
      idSpent: map['idSpent'] as int,
      description: map['description'] as String,
      category: map['category'] as String,
      type: map['type'] as String,
      spentAmount: map['spentAmount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Spent.fromJson(String source) => Spent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Spent(idSpent: $idSpent, description: $description, category: $category, type: $type, spentAmount: $spentAmount)';
  }

  @override
  bool operator ==(covariant Spent other) {
    if (identical(this, other)) return true;
  
    return 
      other.idSpent == idSpent &&
      other.description == description &&
      other.category == category &&
      other.type == type &&
      other.spentAmount == spentAmount;
  }

  @override
  int get hashCode {
    return idSpent.hashCode ^
      description.hashCode ^
      category.hashCode ^
      type.hashCode ^
      spentAmount.hashCode;
  }
}
