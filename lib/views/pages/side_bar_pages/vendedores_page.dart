import 'package:flutter/material.dart';

class VendedoresPage extends StatelessWidget {
  const VendedoresPage({super.key});
  static const String routeName = '/vendedor';

  Widget _rowHeader(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade700),
          color: Colors.deepPurple.shade100,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
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
          Row(
            children: [
              _rowHeader('LOGO', 1),
              _rowHeader('RAZÃO SOCIAL', 3),
              _rowHeader('CIDADE', 2),
              _rowHeader('ESTADO', 2),
              _rowHeader('AÇÃO', 1),
              _rowHeader('VER MAIS', 1),
            ],
          ),
        ],
      ),
    );
  }
}
