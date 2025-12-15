import 'package:flutter/material.dart';
import '../data/app_colors.dart';
import '../data/mock_data.dart';
import '../widgets/status_color_util.dart';
import 'detail_screen.dart';

class PantallaRastreoEnvios extends StatelessWidget {
  const PantallaRastreoEnvios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento de Mercancía'),
        centerTitle: true,
        backgroundColor: simmPrimary,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: simmPrimary.withOpacity(0.95),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Guía / Origen-Destino',
                  style: TextStyle(
                    color: simmAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Estado Actual',
                  style: TextStyle(
                    color: simmAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaEnvios.length,
              itemBuilder: (context, index) {
                final envio = listaEnvios[index];
                final estadoColor = getColorForEstado(envio['estado']!);
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: simmPrimary,
                      child: Icon(
                        Icons.inventory,
                        color: simmAccent,
                        size: 20,
                      ),
                    ),
                    title: Text('Guía: ${envio['guia']}'),
                    subtitle: Text('${envio['origen']} > ${envio['destino']}'),
                    trailing: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: estadoColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        envio['estado']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PantallaDetalle(envio: envio),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: simmPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Volver a Inicio',
                style: TextStyle(color: simmAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}