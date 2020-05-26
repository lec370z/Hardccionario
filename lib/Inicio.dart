import 'package:flutter/material.dart';
import 'package:hardccionario/Componentes.dart';
import 'Componentes.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Inicio extends StatelessWidget{
  static BuildContext contexto;
  const Inicio({Key key}): super(key: key);
  ListTile getListItem(Icon icono, String opcion, String route){
  return ListTile(
    leading: icono,
    title: Text(opcion),
    onTap: (){
      Navigator.pushNamed(contexto, route);
      },
  );
  }

  ListView getMenu(BuildContext context){
    return ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
        ),
        getListItem(Icon(Icons.navigate_next), 'Componentes', '/'),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    contexto = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hardccionario'),
      ),
      drawer: Drawer(
        child: getMenu(context),
      ),
      body: FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: (){
          Componentes();
        },
        child: Text(
          "Componentes",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
