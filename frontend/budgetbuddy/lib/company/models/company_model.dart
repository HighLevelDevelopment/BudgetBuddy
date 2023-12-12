// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompanyModel {
  int idCompany;
  String name;
  String trading;
  String document;
  CompanyModel({
    required this.idCompany,
    required this.name,
    required this.trading,
    required this.document,
  });

  CompanyModel copyWith({
    int? idCompany,
    String? name,
    String? trading,
    String? document,
  }) {
    return CompanyModel(
      idCompany: idCompany ?? this.idCompany,
      name: name ?? this.name,
      trading: trading ?? this.trading,
      document: document ?? this.document,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCompany': idCompany,
      'name': name,
      'trading': trading,
      'document': document,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      idCompany: map['idCompany'] as int,
      name: map['name'] as String,
      trading: map['trading'] as String,
      document: map['document'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyModel(idCompany: $idCompany, name: $name, trading: $trading, document: $document)';
  }

  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.idCompany == idCompany &&
      other.name == name &&
      other.trading == trading &&
      other.document == document;
  }

  @override
  int get hashCode {
    return idCompany.hashCode ^
      name.hashCode ^
      trading.hashCode ^
      document.hashCode;
  }
}
