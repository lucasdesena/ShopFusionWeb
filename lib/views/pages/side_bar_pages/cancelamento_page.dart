import 'package:flutter/material.dart';

class CancelamentoPage extends StatelessWidget {
  const CancelamentoPage({super.key});
  static const String routeName = '/cancelamento';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
    );
  }
}
