import 'package:flutter/material.dart';
class otraPagina extends StatelessWidget {
  const otraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otra Pagina',),
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal[300],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OLI', style: TextStyle(
                fontSize: 60,
                color: Colors.teal[300],
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
