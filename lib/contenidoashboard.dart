import 'package:dashboard/urls.dart';
import 'package:flutter/material.dart';

Widget tarjeta(String titulo, int valor, Icon icono, Color color) {
  return Card(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icono,
          const SizedBox(height: 10),
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            valor.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget tarjetas(int numeroColumnas) {
  return GridView.count(
    crossAxisCount: numeroColumnas,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    padding: const EdgeInsets.all(16.0),
    children: [
      tarjeta("Usuarios Activos", 150, const Icon(Icons.person, color: Colors.white, size: 40), Colors.purple),
      tarjeta("Ventas", 75, const Icon(Icons.shopping_cart, color: Colors.white, size: 40), Colors.lightBlue),
      tarjeta("Notificaciones", 200, const Icon(Icons.notifications, color: Colors.white, size: 40), Colors.indigo),
    ],
  );
}

Column rowTextos = Column(
  spacing: 8,
  children: [
    ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(70),
      child: Image.network(urlAvatar, width: 70),
    ),
    const Text(
      "Edahi Avila",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Divider(color: Colors.white, thickness: 0.8),
    Text(
      "🍉 Inicio",
      style: TextStyle(
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 160, 137, 243),
        fontSize: 15,
        fontStyle: FontStyle.italic,
      ),
    ),
    Text(
      "🥥 Reportes",
      style: TextStyle(
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 160, 137, 243),
        fontSize: 15,
        fontStyle: FontStyle.italic,
      ),
    ),
    Text(
      "🍍 Configuración",
      style: TextStyle(
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 160, 137, 243),
        fontSize: 15,
        fontStyle: FontStyle.italic,
      ),
    ),
  ],
);

Widget content(BoxConstraints constraints) {
  double w = constraints.maxWidth;
  double h = constraints.maxHeight;
  if (w > 800) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 98, 42, 228),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Text(
            "ui_responsiva_avanzada",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 108, 61, 218),
                child: SizedBox(height: h, width: 200, child: rowTextos),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: tarjetas(3),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } else if (w >= 600 && w <= 800) {
    return Row(
      spacing: 0.2,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          color: const Color.fromARGB(255, 108, 61, 218),
          child: SizedBox(height: h, width: 100, child: rowTextos),
        ),
        tarjetas(2),
      ],
    );
  } else {
    return tarjetas(1);
  }
}

Widget contenidoDashBoard(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return content(constraints);
    },
  );
}
