import 'package:flutter/material.dart';
import '../data/app_colors.dart';

Color getColorForEstado(String estado) {
  switch (estado) {
    case 'Entregado':
      return Colors.green.shade700;
    case 'En Tránsito':
      return Colors.blue.shade700;
    case 'En Bodega':
      return Colors.orange.shade700;
    case 'Retrasado':
      return simmError;
    default:
      return Colors.grey.shade600;
  }
}