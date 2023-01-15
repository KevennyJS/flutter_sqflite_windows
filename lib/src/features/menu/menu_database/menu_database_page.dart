import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/share/dao/client_dao.dart';

import '../../../share/models/client_model.dart';

class MenuDatabasePage extends StatelessWidget {
  const MenuDatabasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientDao clientDao = ClientDao();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Database'),
      ),
      body: Column(
        children: [
          TextButton(
            child: const Text("ADD CLIENT"),
            onPressed: () async {
              ClientModel client = ClientModel(name: 'Nome Cliente 1', cpf: '12345678909', address: "Rua Alguma coisa", phone: "(79) 9 99883-6127", cep: "49.503-102", district: "Serrano");
              ClientModel client2 = ClientModel(name: 'Nome Cliente 2', cpf: '12345678909', address: "Rua Alguma coisa", phone: "(79) 9 99883-6127", cep: "49.503-102", district: "Serrano");
              ClientModel client3 = ClientModel(name: 'Nome Cliente 3', cpf: '12345678909', address: "Rua Alguma coisa", phone: "(79) 9 99883-6127", cep: "49.503-102", district: "Serrano");

              await clientDao.insert(client);
              await clientDao.insert(client2);
              await clientDao.insert(client3);
            },
          ),
        ],
      ),
    );
  }
}
