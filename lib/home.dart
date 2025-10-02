import 'package:flutter/material.dart';
import 'package:kuis/detail.dart';
import 'data.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage(this.username, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (context) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mau makan apa hari ini, ${widget.username}?"),
        backgroundColor: Colors.orange[600],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: foodMenuList.length,
            itemBuilder: (context, index) {
              final foods = foodMenuList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(foods)),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Image.network(
                          foods.imageUrls[0],
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              alignment: Alignment.center,
                              width: 60,
                              child: Text("Gambar tidak ada"),
                            );
                          },
                        ),
                      ),
                    ),
                    // leading: Text(foods.imageUrls[0]),
                    title: Text(
                      foods.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(foods.category),
                        SizedBox(width: 10),
                        Text("-"),
                        SizedBox(width: 10),
                        Text(foods.price),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
