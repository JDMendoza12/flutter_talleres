import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = "Hola, Flutter";

  void _cambiarTitulo() {
    setState(() {
      _title = _title == "Hola, Flutter"
          ? "¡Título cambiado!"
          : "Hola, Flutter";
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Título actualizado")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Juan David Mendoza Rincón", // <-- pon tu nombre completo
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Row con imágenes
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // centra todo el Row
              children: [
                Image.network(
                  "https://fastly.picsum.photos/id/464/200/300.jpg?hmac=M4MNTPYELJRy0vZcT-h-EWmXkPdnXHvF9ufEPkhDt2g", // ejemplo de la web que pasaste
                  width: 100,
                ),
                const SizedBox(width: 20), // separa las imágenes
                Image.asset(
                  "assets/logo.png", // tu imagen local
                  width: 100,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ListView dentro de un Container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Elemento 1"),
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Elemento 2"),
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Elemento 3"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Botón que cambia el título
            ElevatedButton(
              onPressed: _cambiarTitulo,
              child: const Text("Cambiar título"),
            ),
          ],
        ),
      ),
    );
  }
}
