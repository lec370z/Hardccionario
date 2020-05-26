import 'package:sqflite/sqflite.dart';
import 'dart:async';

class componentes {
  String nombre;
  String comp;
  String des;
  int cmp;


  componentes(this.nombre, this.comp,
      this.des, this.cmp);

  Map<String , dynamic> toMap() {
    return {
      "nombre": nombre,
      "comp": comp,
      "desc": des,
      "cmp": cmp,
    };
  }
  componentes.fromMap(Map<String, dynamic> map){
    nombre = map['nom'];
    comp = map['comp'];
    des = map['des'];
    cmp = map['id_len'];
  }
}

class lengDatabase {
  Database _db;

  initDB()  async{
    _db = await openDatabase('componentes.db',
      version: 1,
      onCreate: (Database db, int version){
        db.execute("CREATE TABLE Componentes (cmp INTEGER PRIMARY KEY, nom TEXT NOT NULL);");
        db.execute("CREATE TABLE descripcion (cmp INTEGER , comp TEXT, des TEXT);");
        //enlace de llaves
        db.execute("ALTER TABLE descripcion ADD FOREIGN KEY(id_len) REFERENCES lenguajes(id_len);");
        //llenar bdd
        db.rawInsert("INSERT INTO Componentes(cmp,nombre) VALUES(1,'Capacitores');");
        db.rawInsert("INSERT INTO descripcion(cmp,comp,des,) VALUES(1,'condesadores electroliticos','Los condensadores electrolíticos de aluminio cubren el rango de capacitancia de 0.1μF a 500,000μF, lo que los convierte en uno de los condensadores más grandes en términos de capacidad de almacenamiento. Esta es una de sus principales ventajas, que almacenan un alto valor de carga. Los voltajes de trabajo varían de 10V a 100V. ');");
        db.rawInsert("INSERT INTO descripcion(cmp,comp,des,) VALUES(1,'condesadores de tantalio','Los condensadores de tantalio, al igual que el aluminio, son condensadores electrolíticos, lo que significa que están polarizados. Sus principales ventajas (especialmente sobre los condensadores de aluminio) es que son más pequeños, más livianos y más estables. Tienen menores tasas de fuga y menos inductancia entre los cables. Sin embargo, sus desventajas son que tienen un almacenamiento de capacitancia máximo más bajo y un voltaje de trabajo máximo más bajo. También son más propensos a sufrir daños por los altos picos de corriente.');");
        db.rawInsert("INSERT INTO descripcion(cmp,comp,des,) VALUES(1,'condesadores de poliester','Los condensadores de poliéster están disponibles en el rango de 1nF a 15μF, y con tensiones de trabajo de 50V a 1500V. Vienen con los rangos de tolerancia de 5%, 10% y 20%. Tienen un alto coeficiente de temperatura. Tienen una alta resistencia de aislamiento, por lo que son buenos condensadores de elección para aplicaciones de acoplamiento y/o almacenamiento. En comparación con la mayoría de los otros tipos, los condensadores de poliéster tienen una gran capacidad por unidad de volumen. Esto significa que más capacitancia puede caber en un condensador físicamente más pequeño. Esta característica, junto con su precio relativamente bajo, hace que los condensadores de poliéster sean un condensador ampliamente utilizado, popular y barato.');");
        print(db.rawQuery("SELECT ALL FROM descripcion").toString());
      },
    );
    print("bdd inicializada");
  }
  Future<List<componentes>> getAllDatabase(String sql) async{
    List<Map<String, dynamic>> results = await _db.rawQuery("SELECT * FROM Componentes , descripcion   WHERE (id_len="+sql+");");
    return results.map((map) => componentes.fromMap(map)).toList();
  }

  Future<List<componentes>> getDatabase(String sql) async{
    List<Map<String, dynamic>> results = await _db.rawQuery("SELECT * FROM Componentes , descripcion   WHERE categoria='"+sql+"';");
    print(results);
    return results.map((map) => componentes.fromMap(map)).toList();
  }

  Future<List<componentes>> getLengDatabase() async{
    List<Map<String, dynamic>> results = await _db.rawQuery("SELECT * FROM decripcion;");
    return results.map((map) => componentes.fromMap(map)).toList();
  }

}