import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BoxCartazes extends StatelessWidget {
  const BoxCartazes({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> cartazesStream =
        FirebaseFirestore.instance.collection('cartazes').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: cartazesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Algo deu errado');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = ((constraints.maxWidth / 130) + 0.4).toInt();

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
                final cartazes = snapshot.data!.docs[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.deepPurple,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        cartazes['imagem'],
                      ),
                    ),
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
