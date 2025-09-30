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
    image: 'assets/images/nasigoreng.jpg',
  ),
  MenuStore(name: 'Mie Ayam', price: 12000, image: 'assets/images/mieayam.jpg'),
  MenuStore(
    name: 'Sate Ayam',
    price: 20000,
    image: 'assets/images/sateayam.jpg',
  ),
  MenuStore(name: 'Bakso', price: 10000, image: 'assets/images/bakso.jpg'),
  MenuStore(
    name: 'Gado-Gado',
    price: 14000,
    image: 'assets/images/gadogado.jpg',
  ),
  MenuStore(name: 'Rendang', price: 25000, image: 'assets/images/rendang.jpg'),
  MenuStore(
    name: 'Ayam Bakar',
    price: 22000,
    image: 'assets/images/ayambakar.jpg',
  ),
  MenuStore(
    name: 'Soto Ayam',
    price: 16000,
    image: 'assets/images/sotoayam.jpg',
  ),
  MenuStore(
    name: 'Nasi Uduk',
    price: 15000,
    image: 'assets/images/nasiuduk.jpg',
  ),
  MenuStore(
    name: 'Pecel Lele',
    price: 18000,
    image: 'assets/images/pecellele.jpg',
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
      body: CustomScrollView(
  slivers: [
    // Banner di atas (tidak ikut scroll bareng grid)
    SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    
    ),
    // Grid menu
    SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final menu = menuStores[index];
            return Card(
              key: ValueKey(menu.name), // penting biar gak duplikat child
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(menu.image, fit: BoxFit.cover),
                  ),
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
                      child: const Text("Pesan"),
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: menuStores.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
      ),
    ),
  ],
),

    );
  }
}
