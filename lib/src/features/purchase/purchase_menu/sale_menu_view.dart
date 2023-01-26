import 'package:flutter/material.dart';
import '../../../share/dao/purchases_dao.dart';
import '../../../share/models/buy_model.dart';
import '../edit_purchase/edit_purchase_view.dart';

class PurchaseMenuView extends StatefulWidget {
  const PurchaseMenuView({Key? key}) : super(key: key);

  @override
  State<PurchaseMenuView> createState() => _PurchaseMenuViewState();
}

class _PurchaseMenuViewState extends State<PurchaseMenuView> {
  List<PurchaseModel> purchases = [];


  final PurchaseDao _purchaseDao = PurchaseDao();

  void selectAllSales() async {
    try {
      purchases = await _purchaseDao.selectAll();
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar Vendas")));
    }
  }


  @override
  void initState() {
    selectAllSales();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GERENCIAR COMPRAS'),
          centerTitle: true,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditPurchaseView())).then((value) => selectAllSales());
              },
              child: Container(
                width: 120,
                height: 120,
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
          itemCount: purchases.length,
          itemBuilder: (context, index) {
            PurchaseModel purchase = purchases[index];
            return ListTile(
              title: Text("Compra #${purchase.id}"),
              subtitle: Text(purchase.date.toIso8601String()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPurchaseView(purchaseParameter: purchases[index]))).then((value) => selectAllSales());
                setState(() {});
              },
            );
          },
        ));
  }
}