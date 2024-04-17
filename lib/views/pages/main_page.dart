import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/cancelamento_page.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/carrinho_page.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/categorias_page.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/enviar_cartaz_page.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/painel_page.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/produtos_page.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/vendedores_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _selectedIem = const PainelPage();

  seletorDePagina(item) {
    switch (item.route) {
      case PainelPage.routeName:
        setState(() {
          _selectedIem = const PainelPage();
        });
        break;
      case VendedoresPage.routeName:
        setState(() {
          _selectedIem = const VendedoresPage();
        });
        break;
      case CancelamentoPage.routeName:
        setState(() {
          _selectedIem = const CancelamentoPage();
        });
        break;
      case CarrinhoPage.routeName:
        setState(() {
          _selectedIem = const CarrinhoPage();
        });
        break;
      case CategoriasPage.routeName:
        setState(() {
          _selectedIem = const CategoriasPage();
        });
        break;
      case ProdutosPage.routeName:
        setState(() {
          _selectedIem = const ProdutosPage();
        });
        break;
      case EnviarCartazPage.routeName:
        setState(() {
          _selectedIem = const EnviarCartazPage();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text(
          'Gerenciamento',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      sideBar: SideBar(
        iconColor: Colors.deepPurple,
        textStyle: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 12,
        ),
        items: const [
          AdminMenuItem(
            title: 'Painel',
            icon: Icons.dashboard,
            route: '/',
          ),
          AdminMenuItem(
            title: 'Vendedores',
            icon: Icons.groups_3,
            route: VendedoresPage.routeName,
          ),
          AdminMenuItem(
            title: 'Cancelamento',
            icon: Icons.dashboard,
            route: CancelamentoPage.routeName,
          ),
          AdminMenuItem(
            title: 'Carrinho',
            icon: Icons.shopping_cart,
            route: CarrinhoPage.routeName,
          ),
          AdminMenuItem(
            title: 'Categorias',
            icon: Icons.category,
            route: CategoriasPage.routeName,
          ),
          AdminMenuItem(
            title: 'Produtos',
            icon: Icons.shop,
            route: ProdutosPage.routeName,
          ),
          AdminMenuItem(
            title: 'Enviar Cartaz',
            icon: Icons.add,
            route: EnviarCartazPage.routeName,
          ),
        ],
        selectedRoute: '',
        onSelected: (item) {
          seletorDePagina(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Loja ShopFusion',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedIem,
    );
  }
}
