import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/widgets/box_cartazes.dart';

class EnviarCartazPage extends StatefulWidget {
  const EnviarCartazPage({super.key});
  static const String routeName = '/enviarCartaz';

  @override
  State<EnviarCartazPage> createState() => _EnviarCartazPageState();
}

class _EnviarCartazPageState extends State<EnviarCartazPage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic _image;
  String? fileName;

  Future<void> selecionarImagem() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;

        fileName = result.files.first.name;
      });
    }
  }

  Future<String> _enviarImagemAoStorage(dynamic image) async {
    Reference ref = _storage.ref().child('cartazes').child(fileName!);

    UploadTask uploadTask = ref.putData(
      image,
      SettableMetadata(contentType: 'image/jpg'),
    );

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> _enviarAoFirebaseStore() async {
    EasyLoading.show();
    if (_image != null) {
      String imageUrl = await _enviarImagemAoStorage(_image);

      await _firestore.collection('cartazes').doc(fileName).set({
        'imagem': imageUrl,
      }).whenComplete(() {
        EasyLoading.dismiss();

        setState(() {
          _image = null;
        });
      });
    }
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
                      clipBehavior: Clip.hardEdge,
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(
                          color: Colors.grey.shade800,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text('Cartaz'),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await selecionarImagem();
                      },
                      child: const Text(
                        'Enviar Cartaz',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  _enviarAoFirebaseStore();
                },
                child: const Text(
                  'Salvar',
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Cartazes',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const BoxCartazes(),
        ],
      ),
    );
  }
}
