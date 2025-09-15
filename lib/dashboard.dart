import 'package:dashboard/contenidoashboard.dart';
import 'package:dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation/navigation_provider.dart';
import 'navigation/bottom_navigation.dart';
import 'sections/section_widgets.dart';

Widget _buildContent(NavigationSection section, BuildContext context) {
  switch (section) {
    case NavigationSection.inicio:
      return contenidoDashBoard(context);
    case NavigationSection.reportes:
      return const ReportesSection();
    case NavigationSection.configuracion:
      return const ConfiguracionSection();
  }
}

Widget sinDrawer(int w, BuildContext context){
  return Consumer<NavigationProvider>(
    builder: (context, navigationProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            navigationProvider.currentSection == NavigationSection.inicio
                ? "🍉 Inicio - $w px"
                : navigationProvider.currentSection == NavigationSection.reportes
                    ? "🥥 Reportes - $w px"
                    : "🍍 Configuración - $w px",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 98, 42, 228),    // Color original
                  Color.fromARGB(255, 142, 95, 250),   // Color más claro
                ],
              ),
            ),
          ),
        ),
        body: _buildContent(navigationProvider.currentSection, context),
      );
      }
    );
  }

Widget conDrawer(int w, BuildContext context) {
  return Consumer<NavigationProvider>(
    builder: (context, navigationProvider, child) {
      return Scaffold(
        drawer: drawer(),
        appBar: AppBar(
          title: Text(
            navigationProvider.currentSection == NavigationSection.inicio
                ? "🍉 Inicio - $w px"
                : navigationProvider.currentSection == NavigationSection.reportes
                    ? "🥥 Reportes - $w px"
                    : "🍍 Configuración - $w px",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 98, 42, 228),    // Color original
                  Color.fromARGB(255, 142, 95, 250),   // Color más claro
                ],
              ),
            ),
          ),
        ),
        body: _buildContent(navigationProvider.currentSection, context),
        bottomNavigationBar: const AppBottomNavigation(),
      );
    }
  );
}



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    int w = int.parse((MediaQuery.of(context).size.width).toStringAsFixed(0));
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: w < 600 ? conDrawer(w, context) : sinDrawer(w, context),
    );
  }
}