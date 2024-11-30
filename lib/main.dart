import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Men\'s Clothing',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> clothingItems = [
    {
      'name': 'Casual Shirt',
      'image': 'https://mensworld.com.bd/wp-content/uploads/2024/05/4145.jpg',
      'description': 'A comfortable and stylish casual shirt.',
      'price': '\$25.00',
    },
    {
      'name': 'Formal Suit',
      'image': 'https://img.fruugo.com/product/7/48/1653185487_max.jpg',
      'description': 'Perfect for business meetings and events.',
      'price': '\$120.00',
    },
    {
      'name': 'Denim Jacket',
      'image': 'https://i5.walmartimages.com/seo/HOW-ON-Men-s-Thicken-Warm-Sherpa-Lined-Denim-Jacket-Casual-Button-Jean-Trucker-Jackets-Coat-Blue-L_74b3d486-be95-443c-a4c2-5b1022d29012.4ffbd3f2384cfc03edc81f7715749065.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
      'description': 'Trendy and durable denim jacket.',
      'price': '\$70.00',
    },
    {
      'name': 'Trousers',
      'image': 'https://cdna.lystit.com/photos/yoox/cf5a06a3/lyle-scott-Midnight-blue-Trouser.jpeg',
      'description': 'Stylish slim-fit trousers.',
      'price': '\$40.00',
    },
    {
      'name': 'Sweater',
      'image': 'https://mobile.yoox.com/images/items/14/14408263QO_14_f.jpg?impolicy=crop&width=387&height=490',
      'description': 'Warm and cozy wool sweater.',
      'price': '\$35.00',
    },
    {
      'name': 'Leather Boots',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeyo031PU1YdIDx6mSJmF44CnwQrSu8roZ_A&s',
      'description': 'Durable leather boots for all occasions.',
      'price': '\$85.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('211208'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 4,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(item: item),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        item['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue[800],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, String> item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(item['name']!, style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item['image']!,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item['description']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Price: ${item['price']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
