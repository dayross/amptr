
// To parse this JSON data, do
//
//     final tokenEntity = tokenEntityFromJson(jsonString);

import 'dart:convert';

TokenEntity tokenEntityFromJson(String str) => TokenEntity.fromJson(json.decode(str));


class TokenEntity {
    final String accessToken;
    final String tokenType;
    final int expiresIn;

    TokenEntity({
        required this.accessToken,
        required this.tokenType,
        required this.expiresIn,
    });

    factory TokenEntity.fromJson(Map<String, dynamic> json) => TokenEntity(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );

}
