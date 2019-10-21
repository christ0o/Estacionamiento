import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

main()=>runApp(CostoEstacionamiento());

class CostoEstacionamiento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State{
  double costoi=0.0;
  double costof=0.0;
  DateTime t1;
  DateTime t2;
  int diferencia;
  double minutos;
  int fraccion;
  double fraccion1;
  double cfraccion;
  double cfraccion1;
  double total;


  
  

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Costo Estacionamiento'),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[ 
          TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.attach_money, color: Colors.blue),
            labelText: 'Costo 1a hora',
            hintText: 'Escribe cuál es el costo por la primera hora',
           border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
           onChanged: (cambio){
            setState(() {
             costoi= double.parse(cambio);
             });
             },
        ),
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.attach_money, color: Colors.blue),
            labelText: 'Costo por fracción',
            hintText: 'Escribe cuál es el costo por fracción de hora',
           border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
            onChanged: (cambio){
            setState(() {
             costof= double.parse(cambio);
             });
             },
        ),
        DateTimePickerFormField(
          inputType: InputType.time,
          format: DateFormat("HH:mm"),
          initialTime: TimeOfDay.now(),
          editable: false,
          decoration: InputDecoration(
            labelText: 'Presiona para elegir tu hora de llegada',
            hasFloatingPlaceholder: false,
            icon: Icon(Icons.access_time, color: Colors.blue),  
          ),
          onChanged: (cambio){
            setState(() {
             t1 = cambio; 
            });
          },
        ),
        DateTimePickerFormField(
          inputType: InputType.time,
          format: DateFormat("HH:mm"),
          initialTime: TimeOfDay.now(),
          editable: false,
          decoration: InputDecoration(
            labelText: 'Presiona para elegir tu hora de salida',
            hasFloatingPlaceholder: false,
            icon: Icon(Icons.access_time, color: Colors.blue),  
          ),
          onChanged: (cambio){
            setState(() {
             t2 = cambio;
            });
            
          },
        ),
        FlatButton(
          color: Colors.lightBlue,
          textColor: Colors.white,
          splashColor: Colors.blueAccent,
          child: Text('Presiona para calcular tu pago total'),
          padding: EdgeInsets.all(5),
          onPressed:(){
            setState(() {
             diferencia = DateTime.parse(t2.toString()).difference(DateTime.parse(t1.toString())).inMinutes;
             minutos= (diferencia)-60.0; 
             fraccion = (minutos-1)~/15;
             fraccion1 = minutos%45;
             cfraccion = fraccion*costof;
             if(fraccion1>00.01){
               cfraccion1= costof;
               total= cfraccion+cfraccion1+costoi;
             } else {
               total= cfraccion+costoi;
             }
             
            });
          }
         ,
        ),
        Text('El total que tienes que pagar es de: $total')

            ],
          ),
        ),
      )
    );
  }
}

