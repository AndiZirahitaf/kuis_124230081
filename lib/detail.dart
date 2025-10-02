import 'package:flutter/material.dart';
import 'data.dart';
import 'home.dart';
// import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final FoodMenu food;
  const DetailPage(this.food, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    // if (!await launchUrl(uri)) {
    //   throw Exception('Could not launch $url');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.name)),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.network(
                widget.food.imageUrls[0],
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 350,
                    child: Text("Gambar tidak ada"),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Berhasil Menyimpan ${widget.food.name}",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shape_line, size: 15, color: Colors.black54),
                        SizedBox(width: 4),
                        Text(
                          widget.food.category,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(Icons.timer, size: 15, color: Colors.black54),
                        SizedBox(width: 2),
                        Text(
                          widget.food.cookingTime,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  widget.food.price,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange[600],
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Deskripsi",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.food.description,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 25),
                Text(
                  "Bahan-bahan",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.food.ingredients,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil Membeli ${widget.food.name}"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 36),
                    backgroundColor: Colors.orange[600],
                    foregroundColor: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.trolley),
                      SizedBox(width: 10),
                      Text("Pesan Sekarang"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isFavorite = false;
}
