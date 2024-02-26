import 'package:flutter/material.dart';

class CategoriasPage extends StatelessWidget {
  const CategoriasPage({super.key});
  static const String routeName = '/categorias';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Categorias',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
