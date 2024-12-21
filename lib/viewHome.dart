import 'package:cats_api/api/CatImage.dart';
import 'package:cats_api/api/Service.dart';
import 'package:cats_api/otraPagina.dart';
import 'package:flutter/material.dart';

class viewHome extends StatefulWidget {
  const viewHome({super.key});

  @override
  State<viewHome> createState() => _viewHomeState();
}

class _viewHomeState extends State<viewHome> {
  Future<CatImage>? _futureCatImage;

  @override
  void initState() {
    super.initState();
    _futureCatImage = Service().elementImage();
  }

  void _refreshImage() {
    setState(() {
      _futureCatImage = Service().elementImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats API'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Cats API',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<CatImage>(
              future: _futureCatImage,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _refreshImage,
                        child: Image.network(snapshot.data!.url, height: 300),
                      ),
                    ],
                  );
                } else {
                  return const Text('No data available');
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal[300],
              ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => otraPagina()));
                },
                child: Text('Ir a otra pagina', style: TextStyle(
                  color: Colors.white,
                ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}