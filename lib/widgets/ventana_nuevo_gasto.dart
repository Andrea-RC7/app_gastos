//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:app_gastos/modelo/gasto.dart';

class VentanaNuevoGasto extends StatefulWidget {

  final void Function (Gasto gasto) funcionAgregarGasto;
  const VentanaNuevoGasto({super.key, required this.funcionAgregarGasto});

  @override
  State<VentanaNuevoGasto> createState() => _VentanaNuevoGastoState();
}

class _VentanaNuevoGastoState extends State<VentanaNuevoGasto> {

  final _tituloSeleccionado =  TextEditingController();
  final _montoSeleccionado = TextEditingController();
  DateTime? _fechaSeleccionada;
  Categoria _categoriaseleccionada = Categoria.comida;

  @override
  void dispose() {
    _tituloSeleccionado.dispose();
    _montoSeleccionado.dispose();
    super.dispose();
  }

  void  _enviarNuevoGasto(){
    final montoConvertido = double.parse(_montoSeleccionado.text);
    final montoInvalido =  montoConvertido == null || montoConvertido<0;
    if  ( _tituloSeleccionado.text.trim().isEmpty || montoInvalido || _fechaSeleccionada==null ){
      
      showDialog(
        context: context, 
        builder: (ctx) =>AlertDialog(
          title: Text('Datos incorrectos'),
          content: Text('Favorde igresar Titulo, Fecha y monto'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: Text('Ok'))
          ],
        ));
      return;
    }
    widget.funcionAgregarGasto(Gasto(
      titulo: _tituloSeleccionado.text,
      monto: montoConvertido, 
      fecha: _fechaSeleccionada!, 
      categoria:_categoriaseleccionada ));
      Navigator.pop(context);
  }

  void _mostrarCalendario() async {
    final ahora=DateTime.now();
    final primeraFecha= DateTime(ahora.year-1,ahora.month,ahora.day);
    final fechaCalendario = await showDatePicker(
      context: context, 
      firstDate: primeraFecha, 
      lastDate: ahora);

      setState(() {
        _fechaSeleccionada = fechaCalendario;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _tituloSeleccionado,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Titulo')
            ),
          ),
          TextField(
            controller: _montoSeleccionado,
            keyboardType: TextInputType.number ,
            decoration: InputDecoration(label: Text('Costo')),
          ),
          Row(
            children: [
              Text(_fechaSeleccionada ==null 
                ? 'Fecha no seleccionada'
                :formateado.format(_fechaSeleccionada!)),
              IconButton(
                onPressed: _mostrarCalendario, icon:Icon(Icons.calendar_month), )
            ],
          ),
          Row(
            children: [
              Text('Seleccionar categoria'),
              SizedBox(width: 30,),
              DropdownButton(
                value: _categoriaseleccionada,
                items: Categoria.values.map(
                  (micategoria)=>DropdownMenuItem(
                    value:micategoria,
                    child: Text(micategoria.name.toUpperCase()))
                ).toList(), 
                onChanged: (valor){
                  if(valor== null){
                    return;
                  }
                  setState(() {
                    _categoriaseleccionada=valor;
                  });
                })
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              ElevatedButton(onPressed: _enviarNuevoGasto, child: Text('Guardar Gasto')),
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

