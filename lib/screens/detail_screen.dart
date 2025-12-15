import 'package:flutter/material.dart';
import '../data/app_colors.dart';

class PantallaDetalle extends StatefulWidget {
  final Map<String, String> envio;

  const PantallaDetalle({super.key, required this.envio});

  @override
  State<PantallaDetalle> createState() => _PantallaDetalleState();
}

class _PantallaDetalleState extends State<PantallaDetalle> {
  late TextEditingController _novedadController;
  String _estadoNovedad = 'Esperando registro...';

  @override
  void initState() {
    super.initState();
    _novedadController = TextEditingController(
      text: 'Novedad: El paquete fue recibido en el centro de distribución.',
    );
  }

  @override
  void dispose() {
    _novedadController.dispose();
    super.dispose();
  }

  void _registrarNovedad() {
    final novedad = _novedadController.text;
    if (novedad.isEmpty) {
      setState(() =>
          _estadoNovedad = 'ERROR: La novedad no puede estar vacía.');
      return;
    }
    setState(() =>
        _estadoNovedad =
            'Novedad registrada para Guía ${widget.envio['guia']}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_estadoNovedad),
        backgroundColor: simmPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novedades Guía: ${widget.envio['guia']}'),
        backgroundColor: simmPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: simmAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: simmPrimary, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Origen: ${widget.envio['origen']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Destino: ${widget.envio['destino']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Estado Actual: ${widget.envio['estado']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: simmPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Detalles y Registro de Novedades',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: simmPrimary,
              ),
            ),
            const Divider(),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: simmPrimary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Guía ID:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.envio['guia']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Nueva Novedad del Envío',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: simmPrimary,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _novedadController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText:
                    'Escribe el detalle del evento (ej: Llegada a Ciudad X)',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: simmPrimary),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrarNovedad,
              style: ElevatedButton.styleFrom(
                backgroundColor: simmPrimary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Registrar Novedad',
                style: TextStyle(fontSize: 18, color: simmAccent),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _estadoNovedad.startsWith('ERROR')
                    ? simmError.withOpacity(0.2)
                    : simmAccent.withOpacity(0.2),
                border: Border.all(
                  color: _estadoNovedad.startsWith('ERROR')
                      ? simmError
                      : simmPrimary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _estadoNovedad,
                style: TextStyle(
                  color: _estadoNovedad.startsWith('ERROR')
                      ? simmError
                      : simmPrimary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Volver a la Lista de Rastreo',
                  style: TextStyle(
                    color: simmPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}