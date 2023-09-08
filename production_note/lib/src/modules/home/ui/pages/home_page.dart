import 'package:flutter/material.dart';
import 'package:production_note/src/modules/auth/interactors/atoms/auth_atom.dart';

import '../../enums/appbar_menus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5.0,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<AppBarMenus>(
                value: AppBarMenus.myAccount,
                child: Text("Minha Conta"),
              ),
              const PopupMenuItem<AppBarMenus>(
                value: AppBarMenus.settings,
                child: Text("Configurações"),
              ),
              const PopupMenuItem<AppBarMenus>(
                value: AppBarMenus.logout,
                child: Text("Sair"),
              ),
            ];
          }, onSelected: (value) {
            if (value == AppBarMenus.myAccount) {
              print("My account menu is selected.");
            } else if (value == AppBarMenus.settings) {
              print("Settings menu is selected.");
            } else if (value == AppBarMenus.logout) {
              logoutAction.call();
            }
          }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('Menu'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SizedBox(
              width: 600,
              child: Card(
                color: const Color.fromARGB(255, 246, 247, 245),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Acesso Rápido",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Produtos e Estoque",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Expanded(
                        child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              mainAxisExtent: 100,
                            ),
                            children: [
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        opacity: 0.5,
                                        image: AssetImage("images/insumos.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                      child: Text(
                                    "Insumos",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  )),
                                ]),
                              ),
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        opacity: 0.5,
                                        image: AssetImage("images/produto.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                      child: Text(
                                    "Produtos",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  )),
                                ]),
                              ),
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        opacity: 0.5,
                                        image:
                                            AssetImage("images/producao.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                      child: Text(
                                    "Produção",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  )),
                                ]),
                              ),
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Stack(children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        opacity: 0.5,
                                        image: AssetImage("images/estoque.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                      child: Text(
                                    "Estoque",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  )),
                                ]),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
