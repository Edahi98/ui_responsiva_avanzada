import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_provider.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return BottomNavigationBar(
          currentIndex: NavigationSection.values.indexOf(navigationProvider.currentSection),
          selectedItemColor: const Color.fromARGB(255, 98, 42, 228),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            navigationProvider.changeSection(NavigationSection.values[index]);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Reportes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configuración',
            ),
          ],
        );
      },
    );
  }
}