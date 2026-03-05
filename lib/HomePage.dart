import 'package:flutter/material.dart';
import 'package:epo_app/siniflar.dart/veritabani.dart';
import 'package:epo_app/UrunEkle.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool fiyatGoster = true;
  bool fiyatKirmizi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünler"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 212, 117, 196),
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("Fiyatları Göster"),
                      Checkbox(
                        value: fiyatGoster,

                        onChanged: (value) {
                          setState(() {
                            fiyatGoster = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Toplam Ürün sayısı"),
                      Text(
                        " = ${urunler.length}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Fiyat Kırmızı"),
                      Switch(
                        value: fiyatKirmizi,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            fiyatKirmizi = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                final urun = urunler[index];

                return Dismissible(
                  key: Key(urun.ad ?? index.toString()),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      return await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Ürünü Sil"),
                          content: const Text(
                            "Bu ürünü silmek istediğinize emin misiniz?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text("İptal"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text("Sil"),
                            ),
                          ],
                        ),
                      );
                    } else if (direction == DismissDirection.startToEnd) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UrunDetay(urun: urun),
                        ),
                      );
                      return false;
                    }
                    return false;
                  },

                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      setState(() {
                        urunler.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Ürün silindi")),
                      );
                    }
                  },

                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag, color: Colors.blue),
                          const SizedBox(height: 4),
                          Text(
                            urun.kategori ?? "",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      title: Text(
                        urun.ad ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: fiyatGoster
                          ? Text(
                              "Fiyat: ${urun.fiyat} TL",
                              style: TextStyle(
                                color: fiyatKirmizi ? Colors.red : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Urunekle()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UrunDetay extends StatelessWidget {
  final urun;

  const UrunDetay({super.key, required this.urun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(urun.ad ?? "Ürün Detayı")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ürün Adı: " + urun.ad ?? "",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.category, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  "Kategori: " + urun.kategori,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Fiyat: ${urun.fiyat} TL",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
