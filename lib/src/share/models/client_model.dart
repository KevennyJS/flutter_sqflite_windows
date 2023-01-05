class ClientModel {
  int? id;
  String name;
  String cpf;
  String phone;
  String address;
  String district;
  String cep;

  ClientModel({
    this.id,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.address,
    required this.district,
    required this.cep,
  });

  factory ClientModel.fromSQLite(Map map)=> ClientModel(
    id: map['id'],
    name: map['nome'],
    cpf: map['cpf'],
    phone: map['telefone'],
    address: map['endereco'],
    district: map['bairro'],
    cep: map['cep'],
  );

  static List<ClientModel> fromSQLiteList(List list) => list.map((e) => ClientModel.fromSQLite(e)).toList();

  List toSQLiteList()=> [
    id,
    name,
    cpf,
    phone,
    address,
    district,
    cep,
  ];
}
