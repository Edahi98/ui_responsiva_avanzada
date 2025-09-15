import 'package:dashboard/urls.dart';
import 'package:flutter/material.dart';

Widget drawer(){
  return Drawer(
    shadowColor: Colors.orangeAccent,
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 98, 42, 228),    // Color original
            Color.fromARGB(255, 142, 95, 250),   // Color más claro
          ],
        ),
      ),
      padding: EdgeInsets.all(40),
      child: Column(
        spacing: 40,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(180),
            child: Image.network(
              urlAvatar,
              width: 180,
            ),
          ),
          const Text(
            "Edahi Yaxquin Avila Garcia",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.8,
          ),
          const Text("🍉 Inicio", style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 160, 137, 243),
            fontSize: 20,
            fontStyle: FontStyle.italic
          ),),
          const Text("🥥 Reportes", style: TextStyle(
            letterSpacing: 2,
            color: Color.fromARGB(255, 160, 137, 243),
            fontSize: 20,
            fontStyle: FontStyle.italic
          ),),
          const Text(" 🍍 Configuración", style: TextStyle(
            letterSpacing: 2,
            color: Color.fromARGB(255, 160, 137, 243),
            fontSize: 20,
            fontStyle: FontStyle.italic
          ),),
        ],
      ),
    )
  );
}