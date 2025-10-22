import 'package:app_gastos/modelo/gasto.dart';
import 'package:flutter/material.dart';

class GastoItem extends StatelessWidget {

  final Gasto gasto;
  const GastoItem({super.key, required this.gasto});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
        children:[
          Text(gasto.titulo),
          Row(
            children: [
              Text('\$ ${gasto.monto.toStringAsFixed(2)}'),
              Spacer(),
              Icon(categoriaIcons[gasto.categoria]),
              Spacer(),
              Text(gasto.fechaFormateada)
            ],
          )
        ],
            ),
      ));
  }
}