import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/features/client/edit_client/edit_client_page.dart';

import '../../../share/dao/client_dao.dart';
import '../../../share/dao/provider_dao.dart';
import '../../../share/models/client_model.dart';
import '../../../share/models/provider_model.dart';
import '../../../share/widgets/card_menu.dart';
import '../edit_provider/edit_provider_page.dart';

class ProviderMenuView extends StatefulWidget {
  const ProviderMenuView({Key? key}) : super(key: key);

  @override
  State<ProviderMenuView> createState() => _ProviderMenuViewState();
}

class _ProviderMenuViewState extends State<ProviderMenuView> {
  List<ProviderModel> clients = [];
  final ProviderDao _providerDao = ProviderDao();

  void selectAllProviders() async {
    try {
      clients = await _providerDao.selectAll();
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar fornecedores")));
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
          title: const Text('GERENCIAR FORNECEDORES'),
          centerTitle: true,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProviderPage())).then((value) => selectAllProviders());
              },
              child: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text("Criar fornecedor", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
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
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProviderPage(providerParameter: clients[index]))).then((value) => selectAllProviders());
                setState(() {});
              },
            );
          },
        ));
  }
}
