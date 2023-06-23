import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<persona> _personas = [
    persona("cesar", "Rivera", "00000000", "72724400@chertus.edusex.com.pe_e")

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      

      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          
          title: const Text('CONTACTOS'),
          backgroundColor: Colors.amber,
          
          

      
        ),
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index){
            return ListTile(
              onLongPress: (){
                this._borrarPersona(context, _personas[index]);
              },
              title: Text(_personas[index].name + ' ' + _personas[index].lastname),
              subtitle: Text(_personas[index].phone+ ' ' + _personas[index].correo),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0,1))
                ),
                  trailing: Icon(Icons.arrow_forward_ios),
            );
          }
          )
        ),
      );
    }

    _borrarPersona(context, persona persona){
      showDialog(context: context, builder: ( _ ) => AlertDialog(
        title: Text("Eliminar contacto"),
        content: Text("esta seguro de que desea eliminar a " + persona.name + ' '),
        actions: [
          FloatingActionButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("cerrar",
          style: TextStyle(color: Colors.black),)),
          FloatingActionButton(onPressed: (){
            print(persona.name);
            this.setState(() {
              
            });
            this._personas.remove(persona);
            Navigator.pop(context);
          }, child: Text("Borrar", 
          style: TextStyle(color: Color.fromARGB(255, 241, 13, 13)),
          )),
        ],
      ));
    }
}

class persona{
  String name;
  String lastname;
  String phone;
  String correo;

  persona(this.name, this.lastname, this.phone, this.correo);
}