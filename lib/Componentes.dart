import 'package:flutter/material.dart';
import 'package:hardccionario/database.dart';
import 'database.dart';

lengDatabase db = lengDatabase();


class Componentes extends StatelessWidget{
  String sql;

  Componentes(this.sql);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista"),
        ),
        body: FutureBuilder(
          future: db.initDB(),
          builder: (BuildContext, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _datos(context);
            } else {
              return Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              );
            }
          },
        )
    );
  }
  _datos(BuildContext context){
    return FutureBuilder(
      future: db.getDatabase(sql),
      builder: (BuildContext context, AsyncSnapshot<List<componentes>> snapshot){
        print(snapshot.hasData);
        if(snapshot.hasData){
          return ListView(
            children: <Widget>[
              for (componentes len in snapshot.data) Container(
                  child: Row(
                      children: <Widget>[
                        ListTile(title: Text(len.nombre)),
                        Container(
                          child: Column(
                            children: <Widget>[
                              ListTile(title: Text(len.comp),)
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              ListTile(title: Text(len.des),)
                            ],
                          ),
                        )
                      ]
                  )
              )

            ],
          );
        }else{
          return Center(
            child:Text("404 not font"),
          );
        }
      },
    );
  }
  consulta(String sql){
    print("entraste a la consulta");
    print(sql.length);
    if(sql.length > 1){
      return db.getDatabase(sql);
    }else{
      return db.getAllDatabase(sql);
    }
  }
}