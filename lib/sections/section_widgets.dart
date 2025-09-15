import 'package:flutter/material.dart';

class InicioSection extends StatelessWidget {
  const InicioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sección de Inicio',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ReportesSection extends StatelessWidget {
  const ReportesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reporte de Ventas Mensual',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 98, 42, 228),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Total de Ventas',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$158,420.00',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 98, 42, 228),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 160, 137, 243),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '+15% vs mes anterior',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Desglose por Categoría',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildCategoriaItem('Productos Frescos', 45200.00, 0.28),
                _buildCategoriaItem('Abarrotes', 65800.00, 0.42),
                _buildCategoriaItem('Bebidas', 47420.00, 0.30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriaItem(String categoria, double monto, double porcentaje) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoria,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                '\$${monto.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: porcentaje,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 98, 42, 228),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfiguracionSection extends StatelessWidget {
  const ConfiguracionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Configuración del Sistema',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 98, 42, 228),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildConfigSection(
                  'Preferencias de Usuario',
                  [
                    _buildConfigItem(
                      'Tema Oscuro',
                      'Cambiar entre tema claro y oscuro',
                      Icons.dark_mode,
                      true,
                    ),
                    _buildConfigItem(
                      'Notificaciones',
                      'Activar notificaciones push',
                      Icons.notifications,
                      false,
                    ),
                    _buildConfigItem(
                      'Modo Compacto',
                      'Reducir el espaciado en la interfaz',
                      Icons.compress,
                      true,
                    ),
                  ],
                ),
                const Divider(height: 40),
                _buildConfigSection(
                  'Seguridad',
                  [
                    _buildConfigItem(
                      'Autenticación de dos factores',
                      'Aumentar la seguridad de tu cuenta',
                      Icons.security,
                      false,
                    ),
                    _buildConfigItem(
                      'Sesiones Activas',
                      'Administrar dispositivos conectados',
                      Icons.devices,
                      false,
                    ),
                  ],
                ),
                const Divider(height: 40),
                _buildConfigSection(
                  'Datos y Almacenamiento',
                  [
                    _buildConfigItem(
                      'Autoguardado',
                      'Guardar cambios automáticamente',
                      Icons.save,
                      true,
                    ),
                    _buildConfigItem(
                      'Modo sin conexión',
                      'Acceder a datos sin internet',
                      Icons.offline_pin,
                      false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }

  Widget _buildConfigItem(String title, String subtitle, IconData icon, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 160, 137, 243).withOpacity(0.1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive ? const Color.fromARGB(255, 98, 42, 228) : Colors.grey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isActive ? const Color.fromARGB(255, 98, 42, 228) : Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isActive ? const Color.fromARGB(255, 98, 42, 228).withOpacity(0.8) : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isActive,
            onChanged: null,
            activeColor: const Color.fromARGB(255, 98, 42, 228),
          ),
        ],
      ),
    );
  }
}