class ProviderModel {
  int? id;
  String name;
  String cnpj;
  String phone;
  String address;
  String district;
  String cep;

  ProviderModel({
    this.id,
    required this.name,
    required this.cnpj,
    required this.phone,
    required this.address,
    required this.district,
    required this.cep,
  });

  factory ProviderModel.fromSQLite(Map map)=> ProviderModel(
    id: map['ID'],
    name: map['NOME'],
    cnpj: map['CNPJ'],
    phone: map['TELEFONE'],
    address: map['ENDERECO'],
    district: map['BAIRRO'],
    cep: map['CEP'],
  );

  static List<ProviderModel> fromSQLiteList(List list) => list.map((e) => ProviderModel.fromSQLite(e)).toList();

  List toSQLiteList()=> [
    id,
    name,
    cnpj,
    phone,
    address,
    district,
    cep,
  ];
}
