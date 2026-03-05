import 'package:flutter/material.dart';
import 'package:epo_app/siniflar.dart/veritabani.dart';

class Urunekle extends StatefulWidget {
  const Urunekle({super.key});

  @override
  State<Urunekle> createState() => _UrunekleState();
}

class _UrunekleState extends State<Urunekle> {
  TextEditingController adController = TextEditingController();
  TextEditingController fiyatController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: adController,
                  decoration: const InputDecoration(
                    labelText: "Ürün Adı",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: fiyatController,
                  decoration: const InputDecoration(
                    labelText: "Fiyat",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: kategoriController,
                  decoration: const InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String ad = adController.text;
                    double fiyat = double.tryParse(fiyatController.text) ?? 0.0;
                    String kategori = kategoriController.text;

                    urunler.add(Urunler(ad: ad, fiyat: fiyat.toInt(), kategori: kategori));
                    setState(() {
                      
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Ürün Ekle"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
