import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoxCategoria extends StatelessWidget {
  const BoxCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> categoriesStream =
        FirebaseFirestore.instance.collection('categorias').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: categoriesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Algo deu errado');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = ((constraints.maxWidth / 170) + 0.4).toInt();

            return GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.size,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final categoria = snapshot.data!.docs[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.deepPurple,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          categoria['imagem'],
                        ),
                      ),
                      Card(
                        color: Colors.black26,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(categoria['nome_categoria']),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
