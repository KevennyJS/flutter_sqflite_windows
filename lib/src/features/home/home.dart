import 'package:flutter/material.dart';
import 'package:flutter_sqflite_windows/src/features/client/client_menu/client_menu_view.dart';
import 'package:flutter_sqflite_windows/src/share/dao/client_dao.dart';
import '../../share/widgets/card_menu.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
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
                const CardMenu(
                  title: 'GERENCIAR CLIENTE',
                  route: '/client_menu',
                ),
                const CardMenu(
                  title: 'GERENCIAR PRODUTO',
                  route: '/client_list',
                ),
                const CardMenu(
                  title: 'GERENCIAR FORNECEDOR',
                  route: '/edit_client',
                ),
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
                    builder: (context) => const ClientMenuView(),
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
