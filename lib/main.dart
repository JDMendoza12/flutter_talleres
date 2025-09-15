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
      _title = _title == "Hola, Flutter" ? "¡Título cambiado!" : "Hola, Flutter";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Título actualizado")),
    );
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
              "Juan David Mendoza Rincón",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Row con Stack y imagen local
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Imagen de internet con Stack
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      "https://fastly.picsum.photos/id/464/200/300.jpg?hmac=M4MNTPYELJRy0vZcT-h-EWmXkPdnXHvF9ufEPkhDt2g",
                      width: 150,
                    ),
                    Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(4),
                      child: const Text(
                        "Juan David Mendoza",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                // Imagen local
                Image.asset(
                  "assets/logo.png",
                  width: 100,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ListView dentro de Container
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
