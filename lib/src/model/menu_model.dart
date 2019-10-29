class Menu {
  List<Jerarquia> items = new List();

  Menu({
    this.items,
  });

  Menu.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null)return;
    for(var item in jsonList){
      final jerarquia = new Jerarquia.fromJsonMap(item);
      items.add(jerarquia);
    }
  }
}

class Jerarquia {
  String nombre;
  String campoProducto;
  String jerarquiaTabla;
  List<Detalle> detalle = new List();

  Jerarquia({
    this.nombre,
    this.campoProducto,
    this.jerarquiaTabla,
    this.detalle,
  });
  Jerarquia.fromJsonMap(Map<String, dynamic> json){
    nombre = json['nombre'];
    campoProducto = json['campro'];
    jerarquiaTabla = json['jertabla'];
    if(json['det']==null)return;
    for(var item in json['det']){
      final deta = new Detalle.fromJsonMap(item);
      detalle.add(deta);
    }
  }

}

class Detalle {
  String codigo;
  String nombre;

  Detalle({
    this.codigo,
    this.nombre,
  });
  Detalle.fromJsonMap(Map<String, dynamic> json){
    codigo = json['cod'];
    nombre = json['nom'];
  }
}
