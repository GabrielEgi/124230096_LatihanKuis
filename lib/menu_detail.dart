import 'package:flutter/material.dart';
import 'menu_page.dart'; 

class MenuDetailPage extends StatefulWidget {
  final MenuStore menu;

  const MenuDetailPage({super.key, required this.menu});

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  final _jumlahOrder = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int total = widget.menu.price * (int.tryParse(_jumlahOrder.text) ?? 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar makanan
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.menu.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Card detail menu
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      widget.menu.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Harga: Rp ${widget.menu.price}",
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jumlah Pesanan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _jumlahOrder,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Masukkan jumlah",
                prefixIcon: Icon(Icons.fastfood),
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),

            // Total harga
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Harga:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Text("Rp $total",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800)),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Tombol Pesan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _jumlahOrder.text.isNotEmpty
                            ? "Pesanan ${_jumlahOrder.text} ${widget.menu.name} berhasil ditambahkan!"
                            : "Silakan masukkan jumlah pesanan.",
                      ),
                      backgroundColor: _jumlahOrder.text.isNotEmpty
                          ? Colors.green
                          : Colors.red,
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart_checkout),
                label: Text(
                  "Pesan Sekarang",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
