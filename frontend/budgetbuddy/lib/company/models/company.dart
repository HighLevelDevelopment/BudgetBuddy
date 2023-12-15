// Company model with Id, Name, Trading, Document

class Company {
  final int id;
  final String name;
  final String trading;
  final String document;

  Company({
    required this.id,
    required this.name,
    required this.trading,  
    required this.document,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['idCompany'],
      name: json['name'],
      trading: json['trading'],
      document: json['document'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'trading': trading,
      'document': document,
    };
  }

  @override
  String toString() {
    return 'Company{id: $id, name: $name, trading: $trading, document: $document}';
  }
}