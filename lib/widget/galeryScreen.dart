import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  List<Map<String, String>> galleryData = [
    {
      "path": "assets/icon/ContactsIcon.jpg",
      "keterangan": "Deskripsi Gambar 1",
      "Diskripsi": "qqqqqqwerstdaadfsdfs.mamlf"
    },
    {
      "path": "assets/icon/ContactsIcon.jpg",
      "keterangan": "Deskripsi Gambar 2"
    },
    // Tambahkan data gambar lainnya sesuai kebutuhan
  ];

  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
          crossAxisSpacing: 8.0, // Jarak antar kolom
          mainAxisSpacing: 8.0, // Jarak antar baris
        ),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          return GalleryItem(
            imagePath: galleryData[index]["path"]!,
            keterangan: galleryData[index]["keterangan"]!,
            Diskripsi: galleryData[index]["Diskripsi"] ?? "",
          );
        },
      ),
    );
  }
}

class GalleryItem extends StatelessWidget {
  final String imagePath;
  final String keterangan;
  final String Diskripsi;

  const GalleryItem(
      {required this.imagePath,
      required this.keterangan,
      required this.Diskripsi});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Image Detail'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          keterangan,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(Diskripsi)
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Back'),
                    ),
                  ],
                ));
      },
      child: Card(
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                keterangan,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
