import 'package:flutter/material.dart';
import '../../../share/models/client_model.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  List<ClientModel> clients = [
    ClientModel(id: 1, name: 'João', cpf: '123.456.789-00', phone: '(11) 99999-9999', address: 'Rua das Flores', district: 'Centro', cep: '12345-678'),
    ClientModel(id: 2, name: 'Maria', cpf: '123.456.789-00', phone: '(11) 99999-9999', address: 'Rua das Flores', district: 'Centro', cep: '12345-678'),
    ClientModel(id: 3, name: 'José', cpf: '123.456.789-00', phone: '(11) 99999-9999', address: 'Rua das Flores', district: 'Centro', cep: '12345-678'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client List'),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          ClientModel client = clients[index];
          return ListTile(
            title: Text(client.name),
            subtitle: Text(client.cpf),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            onTap: (){
              Navigator.pushNamed(context, '/edit_client', arguments: client);
            },
          );
        },
      ),
    );
  }
}
