import 'package:flutter/material.dart';

class VendedoresPage extends StatelessWidget {
  const VendedoresPage({super.key});
  static const String routeName = '/vendedor';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Gerenciar Vendedores',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
