import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/share/dao/client_dao.dart';
import '../../share/widgets/card_menu.dart';
import '../client/client_menu/client_menu_view.dart';
import '../client/edit_client/edit_client_page.dart';
import '../provider/provider_menu/provider_menu_view.dart';

class BaseView extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);
  final ClientDao clientDao = ClientDao();

  final keyClientMenu = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.grey[500]),
                  child: const Center(child: Text('Menu')),
                ),
                // const CardMenu(
                //   title: 'GERENCIAR CLIENTE',
                //   route: '/client_menu',
                // ),
                // const CardMenu(
                //   title: 'GERENCIAR PRODUTO',
                //   route: '/client_list',
                // ),
                // const CardMenu(
                //   title: 'GERENCIAR FORNECEDOR',
                //   route: '/edit_client',
                // ),
              ],
            ),
          ),
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
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const EditClientPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
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
            // CardMenu(title: 'Menu Produto', screenRoute: ProductMenuView()),
            // CardMenu(title: 'Vendas', screenRoute: SaleMenuView()),
            // CardMenu(title: 'Compras', screenRoute: BuyMenuView()),
          ],
        )
        );
  }
}
