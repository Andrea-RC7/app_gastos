import 'package:flutter/material.dart';

class VentanaNuevoGasto extends StatefulWidget {
  const VentanaNuevoGasto({super.key});

  @override
  State<VentanaNuevoGasto> createState() => _VentanaNuevoGastoState();
}

class _VentanaNuevoGastoState extends State<VentanaNuevoGasto> {

  void _mostrarCalendario(){
    final ahora=DateTime.now();
    final primeraFecha= DateTime(ahora.year-1,ahora.month,ahora.day);
    showDatePicker(
      context: context, 
      firstDate: primeraFecha, 
      lastDate: ahora);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Titulo')
            ),
          ),
          TextField(
            keyboardType: TextInputType.number ,
            decoration: InputDecoration(label: Text('Costo')),
          ),
          Row(
            children: [
              Text('Fecha'),
              IconButton(
                onPressed: _mostrarCalendario, icon:Icon(Icons.calendar_month), )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              ElevatedButton(onPressed: (){}, child: Text('Guardar Gasto')),
              SizedBox(width: 10,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('Cancelar')),
            ],
          )
        ],
      ),
      );
  }
}