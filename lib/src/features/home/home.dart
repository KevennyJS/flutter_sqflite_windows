import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/features/payment_method/payment_method_menu/payment_method_menu_view.dart';
import 'package:flutter_sqflite_windows/src/share/dao/client_dao.dart';
import '../../share/mock.dart';
import '../../share/widgets/card_menu.dart';
import '../client/client_menu/client_menu_view.dart';
import '../product/product_menu/product_menu_view.dart';
import '../provider/provider_menu/provider_menu_view.dart';
import '../purchase/purchase_menu/sale_menu_view.dart';
import '../sale/sale_menu/sale_menu_view.dart';

class BaseView extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);
  final ClientDao clientDao = ClientDao();

  final keyClientMenu = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Drawer(
          //   backgroundColor: Colors.grey[200],
          //   elevation: 0,
          //   child: ListView(
          //     children: [
          //       DrawerHeader(
          //         decoration: BoxDecoration(color: Colors.grey[500]),
          //         child: const Center(child: Text('Menu')),
          //       ),
          //       // const CardMenu(
          //       //   title: 'GERENCIAR CLIENTE',
          //       //   route: '/client_menu',
          //       // ),
          //       // const CardMenu(
          //       //   title: 'GERENCIAR PRODUTO',
          //       //   route: '/client_list',
          //       // ),
          //       // const CardMenu(
          //       //   title: 'GERENCIAR FORNECEDOR',
          //       //   route: '/edit_client',
          //       // ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: WillPopScope(
              onWillPop: () async => !await keyClientMenu.currentState!.maybePop(),
              child: Navigator(
                key: keyClientMenu,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const HomeView(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Mock mock = Mock();
        mock.insertMocks();
      },),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home'), centerTitle: true, elevation: 0),
        body: Wrap(
          children: const [
            CardMenu(title: 'Gerenciar Cliente', screenRoute: ClientMenuView()),
            CardMenu(title: 'Menu Fornecedor', screenRoute: ProviderMenuView()),
            CardMenu(title: 'Menu Metodo de Pagamento', screenRoute: PaymentMethodMenuView()),
            CardMenu(title: 'Menu Produto', screenRoute: ProductMenuView()),
            CardMenu(title: 'Vendas', screenRoute: SaleMenuView()),
            CardMenu(title: 'Compras', screenRoute: PurchaseMenuView()),
          ],
        )
        );
  }
}
