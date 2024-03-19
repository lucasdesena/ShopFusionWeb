import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shop_fusion_web_admin/views/pages/side_bar_pages/widgets/box_categoria.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});
  static const String routeName = '/categorias';

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController categoryController = TextEditingController();

  dynamic _image;
  String? fileName;
  late String? categoryName;

  Future<void> _selecionarImagem() async {
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

  Future<String> _enviarCartazDaCategoriaAoStorage(dynamic image) async {
    Reference ref = _storage.ref().child('imagem_categoria').child(fileName!);

    UploadTask uploadTask = ref.putData(
      image,
      SettableMetadata(contentType: 'image/jpg'),
    );

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> enviarCategoria() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show();
      String imageUrl = await _enviarCartazDaCategoriaAoStorage(_image);
      categoryName = categoryController.text;

      await _firestore.collection('categorias').doc(fileName).set({
        'imagem': imageUrl,
        'nome_categoria': categoryName,
      }).whenComplete(() {
        EasyLoading.dismiss();

        setState(() {
          _image = null;
          _formKey.currentState!.reset();
        });
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
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
                                child: Text('Categoria'),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await _selecionarImagem();
                        },
                        child: const Text(
                          'Enviar Imagem',
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 220,
                    child: TextFormField(
                      controller: categoryController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira um nome para a categoria.';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Insira o nome da categoria',
                        hintText: 'Insira o nome da categoria',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await enviarCategoria();
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
                  'Categorias',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const BoxCategoria(),
          ],
        ),
      ),
    );
  }
}
