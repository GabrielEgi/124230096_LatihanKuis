import 'package:flutter/material.dart';
import '../menu_detail.dart';

class MenuStore {
  final String name;
  final int price;
  final String image;

  MenuStore({required this.name, required this.price, required this.image});
}

List<MenuStore> menuStores = [
  MenuStore(
    name: 'Nasi Goreng',
    price: 15000,
    image: 'assets/images/food1.jpg',
  ),
  MenuStore(name: 'Mie Ayam', price: 12000, image: 'assets/images/food2.jpg'),
  MenuStore(name: 'Sate Ayam', price: 20000, image: 'assets/images/food3.jpg'),
  MenuStore(name: 'Bakso', price: 10000, image: 'assets/images/food4.jpg'),
  MenuStore(name: 'Gado-Gado', price: 14000, image: 'assets/images/food5.jpg'),
  MenuStore(name: 'Rendang', price: 25000, image: 'assets/images/food6.jpg'),
  MenuStore(name: 'Ayam Bakar', price: 22000, image: 'assets/images/food7.jpg'),
  MenuStore(name: 'Soto Ayam', price: 16000, image: 'assets/images/food8.jpg'),
  MenuStore(name: 'Nasi Uduk', price: 15000, image: 'assets/images/food9.jpg'),
  MenuStore(
    name: 'Pecel Lele',
    price: 18000,
    image: 'assets/images/food10.jpg',
  ),
];

class MenuPage extends StatelessWidget {
  final String username;
  const MenuPage({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, @$username'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom
            childAspectRatio: 0.8, // proporsi tinggi-lebar card
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: menuStores.length,
          itemBuilder: (context, index) {
            final menu = menuStores[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias, // supaya gambar ikut rounded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Image.asset(menu.image, fit: BoxFit.cover)),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text("Rp ${menu.price}"),
                      ],
                    ),
                  ),

                  // Tombol Pesan
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuDetailPage(menu: menu),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Pesan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
