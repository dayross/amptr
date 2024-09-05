
import 'dart:convert';

import 'package:amptr/domain/entities/entities.dart';

AlbumEntity imageEntityFromJson(String str) => AlbumEntity.fromJson(json.decode(str));


class AlbumEntity {
    List<ImageEntity> data;
    bool success;
    int status;

    AlbumEntity({
        required this.data,
        required this.success,
        required this.status,
    });

    AlbumEntity copyWith({
        List<ImageEntity>? data,
        bool? success,
        int? status,
    }) => 
        AlbumEntity(
            data: data ?? this.data,
            success: success ?? this.success,
            status: status ?? this.status,
        );

    factory AlbumEntity.fromJson(Map<String, dynamic> json) => AlbumEntity(
        data: List<ImageEntity>.from(json["data"].map((x) => ImageEntity.fromJson(x))),
        success: json["success"],
        status: json["status"],
    );
}
