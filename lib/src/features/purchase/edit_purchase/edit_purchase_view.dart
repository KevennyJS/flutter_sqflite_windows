import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/share/dao/payment_method_dao.dart';
import 'package:flutter_sqflite_windows/src/share/models/sale_product_model.dart';
import '../../../share/dao/client_dao.dart';
import '../../../share/dao/product_dao.dart';
import '../../../share/dao/provider_dao.dart';
import '../../../share/dao/purchases_dao.dart';
import '../../../share/dao/sale_dao.dart';
import '../../../share/models/buy_model.dart';
import '../../../share/models/client_model.dart';
import '../../../share/models/payment_method_model.dart';
import '../../../share/models/product_model.dart';
import '../../../share/models/provider_model.dart';
import '../../../share/models/purchase_product_model.dart';
import '../../../share/models/sale_model.dart';

class EditPurchaseView extends StatefulWidget {
  const EditPurchaseView({super.key, this.purchaseParameter});

  final PurchaseModel? purchaseParameter;

  @override
  State<EditPurchaseView> createState() => _EditPurchaseViewState();
}

class _EditPurchaseViewState extends State<EditPurchaseView> {
  final PaymentMethodDao _paymentMethodDao = PaymentMethodDao();
  final ProductDao _productDao = ProductDao();
  final ProviderDao _providerDao = ProviderDao();
  final PurchaseDao _purchaseDao = PurchaseDao();

  PaymentMethodModel? paymentMethod;
  ProductModel? product;
  ProviderModel? provider;
  PurchaseModel purchase = PurchaseModel.empty();

  List<PaymentMethodModel> paymentMethods = [];
  List<ProductModel> products = [];
  List<ProviderModel> providers = [];

  double total = 0;

  void selectAllClients() async {
    try {
      providers = await _providerDao.selectAll();
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar clientes")));
    }
  }

  void selectAllProducts() async {
    try {
      products = await _productDao.selectAll();
      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao buscar produtos")));
    }
  }

  void save() {
    purchase.idProvider = provider!.id!;
    purchase.idPaymentMethod = paymentMethod!.id!;
    purchase.price = product!.price.toDouble();
    purchase.date = DateTime.now();

    if (purchase.id == null) {
      insertPurchase();
      return;
    }

    updatePurchase();
  }

  void insertPurchase() async {
    try {
      PurchaseModel insertedSale = await _purchaseDao.insert(purchase);
      purchase.id = insertedSale.id;
      print("insertedSale.id: ${insertedSale.id}");
      print("product.id: ${product!.id!}");
      await _purchaseDao.insertPurchaseProduct(PurchaseProductModel(id_purchase: purchase.id!, id_product: product!.id!, price: product!.price.toDouble(), quantity: 1));
      mostrarMensagem('Venda inserido com sucesso');
      setState(() {});
    } catch (error) {
      mostrarMensagem('Erro ao inserir venda');
    }
  }

  void updatePurchase() async {
    try {
      if (await _purchaseDao.update(purchase)) {
        mostrarMensagem("Venda atualizado com sucesso");
        return;
      }
      mostrarMensagem('Nenhum dado foi alterado');
    } catch (error) {
      mostrarMensagem('Erro ao atualizar venda');
    }
  }

  void deleteProvider() async {
    try {
      if (purchase.id == null) {
        mostrarMensagem('Impossivel deletar venda não cadastrado');
        return;
      }
      if (await _purchaseDao.delete(purchase)) {
        mostrarMensagem("Venda excluído com sucesso");
        Navigator.pop(context);
        return;
      }
      mostrarMensagem('Nenhum venda foi deletado');
    } catch (error) {
      mostrarMensagem('Erro ao excluir venda');
    }
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
  }

  @override
  Future<void> didChangeDependencies() async {
    PurchaseModel? purchaseParameter = widget.purchaseParameter;

    if (purchaseParameter != null) {
      // if (products.isNotEmpty) {
      //   List<SaleProductModel> saleProducts = await _productDao.getProductFromSale(saleParameter.id!);
      //   print("saleProducts: $saleProducts");
      //   product = products.firstWhere((element) => element.id == saleProducts.first.id_produto);
      //   print(product!.name);
      //   setState(() {});
      // }
      // if (clients.isNotEmpty) {
      //   client = clients.firstWhere((element) => element.id == saleParameter.clientId);
      // }
      // if (paymentMethods.isNotEmpty) {
      //   paymentMethod = paymentMethods.firstWhere((element) => element.id == saleParameter.paymentMethod);
      // }
      //   // paymentMethod = await _paymentMethodDao.selectById(saleParameter.paymentMethod);
      //   // _nameController.text = providerParameter.name;
      //   // _cnpjController.text = providerParameter.cnpj;
      //   // _phoneController.text = providerParameter.phone;
      //   // _addressController.text = providerParameter.address;
      //   // _districtController.text = providerParameter.district;
      //   // _cepController.text = providerParameter.cep;
      purchase = purchaseParameter;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.purchaseParameter != null ? "Editar" : "Criar"} Compra'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 50,
              child: FutureBuilder(
                future: providers.isEmpty ? _providerDao.selectAll() : null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    providers = snapshot.data as List<ProviderModel>;
                    if (widget.purchaseParameter != null) {
                      provider = providers.firstWhere((element) => element.id == purchase.idProvider);
                    }
                    return DropdownButton<ProviderModel>(
                      value: provider,
                      items: providers.map((ProviderModel client) {
                        return DropdownMenuItem<ProviderModel>(
                          value: client,
                          child: Text(client.name),
                        );
                      }).toList(),
                      onChanged: (ProviderModel? client) {
                        setState(() {
                          this.provider = client!;
                        });
                      },
                      isExpanded: true,
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: FutureBuilder(
                future: products.isEmpty ? _productDao.selectAll() : null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    products = snapshot.data as List<ProductModel>;
                    print("products: ${products.map((e) => e.toSQLiteListUpdate())}");
                    print(widget.purchaseParameter?.toSQLiteUpdate().toString());
                    return FutureBuilder(
                      future: widget.purchaseParameter != null ? _productDao.getProductFromPurchase(widget.purchaseParameter!.id!) : null,
                      builder: (context, snapshot) {
                        print("snapshot: ${snapshot.data}");
                        if (snapshot.hasData) {
                          List<PurchaseProductModel> saleProduct = snapshot.data as List<PurchaseProductModel>;
                          if (widget.purchaseParameter != null) {
                            print(product);
                            print(saleProduct.first.id_product);
                            product = products.firstWhere((element) => element.id == saleProduct.first.id_product);
                            total = product!.price;
                          }
                        }
                        return DropdownButton<ProductModel>(
                          value: product,
                          items: products.map((ProductModel product) {
                            return DropdownMenuItem<ProductModel>(
                              value: product,
                              child: Text(product.name),
                            );
                          }).toList(),
                          onChanged: (ProductModel? product) {
                            total = product!.price;
                            setState(() => this.product = product);
                          },
                          isExpanded: true,
                        );
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: FutureBuilder(
                future: paymentMethods.isEmpty ? _paymentMethodDao.selectAll() : null,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    paymentMethods = snapshot.data as List<PaymentMethodModel>;
                    if (widget.purchaseParameter != null) {
                      paymentMethod = paymentMethods.firstWhere((element) => element.id == purchase.idPaymentMethod);
                    }
                    return DropdownButton<PaymentMethodModel>(
                      value: paymentMethod,
                      items: paymentMethods.map((PaymentMethodModel paymentMethod) {
                        return DropdownMenuItem<PaymentMethodModel>(
                          value: paymentMethod,
                          child: Text(paymentMethod.name),
                        );
                      }).toList(),
                      onChanged: (PaymentMethodModel? paymentMethod) {
                        setState(() {
                          this.paymentMethod = paymentMethod!;
                        });
                      },
                      isExpanded: true,
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: Text("Valor final: ${total ?? 0}"),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => save(),
                  child: const Text('Enviar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: purchase.id != null ? Colors.red : Colors.grey),
                  onPressed: purchase.id != null ? () => deleteProvider() : null,
                  child: const Text('Excluir'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
