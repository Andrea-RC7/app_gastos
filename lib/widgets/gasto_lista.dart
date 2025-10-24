import 'package:app_gastos/widgets/gasto_item.dart';
import 'package:app_gastos/modelo/gasto.dart';
import 'package:flutter/material.dart';

class GastoLista extends StatelessWidget {

  final List<Gasto>listaGastos;
  final void Function  (Gasto gasto) funcionEliminarGasto;

  const GastoLista({
    super.key, 
    required this.listaGastos, 
    required this.funcionEliminarGasto
    });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaGastos.length,
      itemBuilder: (contex,index)=>Dismissible(
        key: ValueKey(listaGastos[index]),
        onDismissed: (direccion){
          funcionEliminarGasto(listaGastos[index]);
        },
        child: GastoItem(gasto:listaGastos[index]))//puede ser context e index en vez de ctx y miindex
    );
  }
}