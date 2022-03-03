import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: HomePage()
    ),
  );
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State <HomePage>{

  late Map data;
  late List usersData;
  //Obtener el Historial
  getUsers() async {
    http.Response response = await http.get(Uri.parse('http://localhost:4000/api/movimientos'));
    data = json.decode(response.body);
    setState(() {
      usersData = data['movimientos'];
    });
  }
  //Movimiento Avanzar
  mAvanzar() async {
    http.Response response = await http.get(Uri.parse('http://localhost:4000/api/movimientos/avanzar'));
    debugPrint("Realizo un Movimiento");
  }
  //Moviemiento Retrocerder
  mRetroceder() async {
    http.Response response = await http.get(Uri.parse('http://localhost:4000/api/movimientos/retroceder'));
    debugPrint("Realizo un Movimiento");
  }
  //Giro a la Derecha
  mDerecha() async {
    http.Response response = await http.get(Uri.parse('http://localhost:4000/api/movimientos/derecha'));
    debugPrint("Realizo un Movimiento");
  }
  //Giro a la Derecha
  mIzquierda() async {
    http.Response response = await http.get(Uri.parse('http://localhost:4000/api/movimientos/izquierda'));
    debugPrint("Realizo un Movimiento");
  }

  @override
  initState(){
    super.initState();
    getUsers();
  }


  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('App - CopaPiston'),
          backgroundColor: Colors.indigo[900],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 300,
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Botones Superirores
                      Padding(
                        padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            new RawMaterialButton(
                              onPressed: () {mAvanzar();},
                              elevation: 2.0,
                              fillColor: Color.fromARGB(199, 255, 255, 255),
                              child: Icon(
                                Icons.arrow_circle_up_outlined,
                                size: 80.0,
                              ),
                            padding: EdgeInsets.all(5.0),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                    ),
                    //Botones Centrales
                      Padding(
                        padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            new RawMaterialButton(
                              onPressed: () {mIzquierda();},
                              elevation: 2.0,
                              fillColor: Color.fromARGB(199, 255, 255, 255),
                              child: Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 80.0,
                              ),
                              padding: EdgeInsets.all(0),
                              shape: CircleBorder(),
                            ),
                            new RawMaterialButton(
                              onPressed: () {mDerecha();},
                              elevation: 2.0,
                              fillColor: Color.fromARGB(199, 255, 255, 255),
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 80.0,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ),
                      //Botones Inferiores
                      Padding(
                        padding: const EdgeInsets.all(0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            new RawMaterialButton(
                              onPressed: () {mRetroceder();},
                              elevation: 2.0,
                              fillColor: Color.fromARGB(199, 255, 255, 255),
                              child: Icon(
                                Icons.arrow_circle_down_outlined,
                                size: 80.0,
                              ),
                            padding: EdgeInsets.all(5.0),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                    ),
                    ],
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: usersData == null ? 0 : usersData.length,
                itemBuilder:(BuildContext context, int index){
                  String direccion = usersData[index]["direccion"];
                  
                  
                  return Card(
                    child: Row(
                      children:<Widget> [
                        Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("$index",style: TextStyle(
                          fontSize:20.0,
                          fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      
                      CircleAvatar(
                        backgroundColor: Colors.indigo[900],
                        child:Stack(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: direccion == 'Derecha'?Colors.white: Colors.transparent,
                            ),
                            Icon(
                              Icons.arrow_circle_left_outlined,
                              color: direccion == 'Izquierda'?Colors.white: Colors.transparent,
                            ),
                            Icon(
                              Icons.arrow_circle_up_outlined,
                              color: direccion == 'Avanzar'?Colors.white: Colors.transparent,
                            ),
                            Icon(
                              Icons.arrow_circle_down_outlined,
                              color: direccion == 'Retroceder'?Colors.white: Colors.transparent,
                            ),
                          ],

                        ),
                       
                        
                      ),
                     
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Dispositivo: ${usersData[index]["dispositivo"]}  || Direccion: ${usersData[index]["direccion"]}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      )
                      //Text('${usersData[index]["_id"]}')
                      ],
                    ),
                  );

                },
              ),

            )
          ],
        )
        /*Container(
          height: 500,
          

          
         
          /*child: ListView.builder(
            
            
            itemCount: usersData == null ? 0 : usersData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("$index",style: TextStyle(
                          fontSize:20.0,
                          fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      CircleAvatar(backgroundImage: NetworkImage(usersData[index]["avatar"]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('${usersData[index]["firtsName"]} ${usersData[index]["lastName"]}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      )
                      //Text('${usersData[index]["_id"]}')
                    ],
                    ),
                ),
              );
            },
          ),
          */
        ),
      */
      );
  }
}






