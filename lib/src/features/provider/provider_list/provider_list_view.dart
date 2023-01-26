import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/share/dao/client_dao.dart';
import '../../../share/dao/provider_dao.dart';
import '../../../share/models/client_model.dart';
import '../../../share/models/provider_model.dart';

class ProviderListView extends StatefulWidget {
  const ProviderListView({super.key});

  @override
  State<ProviderListView> createState() => _ProviderListViewState();
}

class _ProviderListViewState extends State<ProviderListView> {
  List<ProviderModel> clients = [];
  final ProviderDao _providerDao = ProviderDao();

  void selectAllProviders() async {
    try{
      clients = await _providerDao.selectAll();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar clientes")));
    }
  }

  @override
  void initState() {
    selectAllProviders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider List'),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          ProviderModel client = clients[index];
          return ListTile(
            title: Text(client.name),
            subtitle: Text(client.cnpj),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            onTap: () async {
              await Navigator.pushNamed(context, '/edit_client', arguments: client).then((value) => selectAllProviders());
              setState(() {});
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/edit_client').then((value) => selectAllProviders()).then((value) => selectAllProviders());
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
