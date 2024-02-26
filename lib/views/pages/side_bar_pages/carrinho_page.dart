import 'package:flutter/material.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});
  static const String routeName = '/carrinho';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Carrinho',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
