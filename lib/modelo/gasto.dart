import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Categoria{trabajo, ocio, escuela, viaje, comida}
const uuid =Uuid();
final formateado = DateFormat.yMd();


const categoriaIcons ={
  Categoria.trabajo:Icons.work,
  Categoria.ocio:Icons.movie,
  Categoria.escuela: Icons.schedule_outlined,
  Categoria.viaje: Icons.flight_takeoff,
  Categoria.comida:Icons.lunch_dining
};

class Gasto{
  final String id;
  final String titulo;
  final double monto;
  final DateTime fecha;
  final Categoria categoria;

  Gasto({
     
    required this.titulo, 
    required this.monto, 
    required this.fecha, 
    required this.categoria
  }):id=uuid.v4();

  String get fechaFormateada{
    return formateado.format(fecha);
}
  
}