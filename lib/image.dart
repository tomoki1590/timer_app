import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? image;
  final ImagePicker picker = ImagePicker();
  Future getImageFromGarally() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('保存しますか？'),
                    actions: [
                      TextButton(onPressed: () {}, child: const Text('はい')),
                      TextButton(onPressed: () {}, child: const Text('いいえ'))
                    ],
                  );
                });
          },
          child: const Text('保存'),
        )
      ], title: const Text('画像を貼る')),
      body: Column(
        children: [
          const Text('画像をセットしてお気に入りのタイマーで勉強！！'),
          ElevatedButton(
              onPressed: () {
                getImageFromGarally();
              },
              child: const Text('画像')),
              Row(
                          children: [
                            Container(
                              height: 200,
                              width: 300,
                              child: image == null
                                  ? Text('画像が選ばれておりません')
                                  : Image.file(image!),
                            ),
                          ],
                        ),
        ],
      ),
    );
  }
}
