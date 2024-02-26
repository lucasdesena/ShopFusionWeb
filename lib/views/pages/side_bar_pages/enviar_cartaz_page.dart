import 'package:flutter/material.dart';

class EnviarCartazPage extends StatelessWidget {
  const EnviarCartazPage({super.key});
  static const String routeName = '/enviarCartaz';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Cartazes',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(
                          color: Colors.grey.shade800,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text('Cartaz'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Enviar Cartaz',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Salvar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
