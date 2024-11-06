// To parse this JSON data, do
//
//     final poemaEntity = poemaEntityFromJson(jsonString);

import 'dart:convert';

PoemaEntity poemaEntityFromJson(String str) => PoemaEntity.fromJson(json.decode(str));


class PoemaEntity {
    String tipo;
    Contenido contenido;

    PoemaEntity({
        required this.tipo,
        required this.contenido,
    });

    factory PoemaEntity.fromJson(Map<String, dynamic> json) => PoemaEntity(
        tipo: json["tipo"],
        contenido: Contenido.fromJson(json["contenido"]),
    );

}

class Contenido {
    String nombre;
    String autor;
    String contenido;
    bool extracto;

    Contenido({
        required this.nombre,
        required this.autor,
        required this.contenido,
        required this.extracto,
    });

    factory Contenido.fromJson(Map<String, dynamic> json) => Contenido(
        nombre: json["nombre"],
        autor: json["autor"],
        contenido: json["contenido"],
        extracto: json["extracto"],
    );
}
