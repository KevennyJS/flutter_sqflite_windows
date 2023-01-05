import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/share/dao/client_dao.dart';
import '../../../share/models/client_model.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  List<ClientModel> clients = [];
  final ClientDao _clientDao = ClientDao();

  void selectAllClients() async {
    try{
      clients = await _clientDao.selectAll();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar clientes")));
    }
  }

  @override
  void initState() {
    selectAllClients();
    super.initState();
  }

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
            onTap: () async {
              await Navigator.pushNamed(context, '/edit_client', arguments: client).then((value) => selectAllClients());
              setState(() {});
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/edit_client').then((value) => selectAllClients()).then((value) => selectAllClients());
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
