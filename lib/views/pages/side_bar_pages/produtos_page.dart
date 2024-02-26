import 'package:flutter/material.dart';

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});
  static const String routeName = '/produtos';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Produtos',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
