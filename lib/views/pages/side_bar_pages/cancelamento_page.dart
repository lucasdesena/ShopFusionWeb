import 'package:flutter/material.dart';

class CancelamentoPage extends StatelessWidget {
  const CancelamentoPage({super.key});
  static const String routeName = '/cancelamento';

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
              'Cancelamento',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          Row(
            children: [
              _rowHeader('NOME', 1),
              _rowHeader('QUANTIDADE', 3),
              _rowHeader('NOME DO BANCO', 2),
              _rowHeader('CONTA DO BANCO', 2),
              _rowHeader('EMAIL', 2),
              _rowHeader('TELEFONE', 1),
            ],
          ),
        ],
      ),
    );
  }
}
