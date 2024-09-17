

// To parse this JSON data, do
//
//     final playlistEntity = playlistEntityFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

PlaylistEntity playlistEntityFromJson(String str) => PlaylistEntity.fromJson(json.decode(str));

String playlistEntityToJson(PlaylistEntity data) => json.encode(data.toJson());

class PlaylistEntity {
    final String href;
    final List<Item> items;
    final int limit;
    final dynamic next;
    final int offset;
    final dynamic previous;
    final int total;

    PlaylistEntity({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    factory PlaylistEntity.fromJson(Map<String, dynamic> json) => PlaylistEntity(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}

class Item {
    final DateTime addedAt;
    final AddedBy addedBy;
    final bool isLocal;
    final dynamic primaryColor;
    final Track track;
    final VideoThumbnail videoThumbnail;

    Item({
        required this.addedAt,
        required this.addedBy,
        required this.isLocal,
        required this.primaryColor,
        required this.track,
        required this.videoThumbnail,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        addedAt: DateTime.parse(json["added_at"]),
        addedBy: AddedBy.fromJson(json["added_by"]),
        isLocal: json["is_local"],
        primaryColor: json["primary_color"],
        track: Track.fromJson(json["track"]),
        videoThumbnail: VideoThumbnail.fromJson(json["video_thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "added_at": addedAt.toIso8601String(),
        "added_by": addedBy.toJson(),
        "is_local": isLocal,
        "primary_color": primaryColor,
        "track": track.toJson(),
        "video_thumbnail": videoThumbnail.toJson(),
    };
}

class AddedBy {
    final ExternalUrls externalUrls;
    final String href;
    final String id;
    final AddedByType type;
    final String uri;
    final String? name;

    AddedBy({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.type,
        required this.uri,
        this.name,
    });

    factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        type: addedByTypeValues.map[json["type"]]!,
        uri: json["uri"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "type": addedByTypeValues.reverse[type],
        "uri": uri,
        "name": name,
    };
}

class ExternalUrls {
    final String spotify;

    ExternalUrls({
        required this.spotify,
    });

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
    );

    Map<String, dynamic> toJson() => {
        "spotify": spotify,
    };
}

enum AddedByType {
    ARTIST,
    USER
}

final addedByTypeValues = EnumValues({
    "artist": AddedByType.ARTIST,
    "user": AddedByType.USER
});

class Track {
    final String? previewUrl;
    final List<String> availableMarkets;
    final bool explicit;
    final TrackType type;
    final bool episode;
    final bool track;
    final Album album;
    final List<AddedBy> artists;
    final int discNumber;
    final int trackNumber;
    final int durationMs;
    final ExternalIds externalIds;
    final ExternalUrls externalUrls;
    final String href;
    final String id;
    final String name;
    final int popularity;
    final String uri;
    final bool isLocal;

    Track({
        required this.previewUrl,
        required this.availableMarkets,
        required this.explicit,
        required this.type,
        required this.episode,
        required this.track,
        required this.album,
        required this.artists,
        required this.discNumber,
        required this.trackNumber,
        required this.durationMs,
        required this.externalIds,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.popularity,
        required this.uri,
        required this.isLocal,
    });

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        previewUrl: json["preview_url"],
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        explicit: json["explicit"],
        type: trackTypeValues.map[json["type"]]!,
        episode: json["episode"],
        track: json["track"],
        album: Album.fromJson(json["album"]),
        artists: List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
        discNumber: json["disc_number"],
        trackNumber: json["track_number"],
        durationMs: json["duration_ms"],
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        popularity: json["popularity"],
        uri: json["uri"],
        isLocal: json["is_local"],
    );

    Map<String, dynamic> toJson() => {
        "preview_url": previewUrl,
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "explicit": explicit,
        "type": trackTypeValues.reverse[type],
        "episode": episode,
        "track": track,
        "album": album.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "disc_number": discNumber,
        "track_number": trackNumber,
        "duration_ms": durationMs,
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "popularity": popularity,
        "uri": uri,
        "is_local": isLocal,
    };
}

class Album {
    final List<String> availableMarkets;
    final AlbumTypeEnum type;
    final AlbumTypeEnum albumType;
    final String href;
    final String id;
    final List<Image> images;
    final String name;
    final String releaseDate;
    final ReleaseDatePrecision releaseDatePrecision;
    final String uri;
    final List<AddedBy> artists;
    final ExternalUrls externalUrls;
    final int totalTracks;

    Album({
        required this.availableMarkets,
        required this.type,
        required this.albumType,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.uri,
        required this.artists,
        required this.externalUrls,
        required this.totalTracks,
    });

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        type: albumTypeEnumValues.map[json["type"]]!,
        albumType: albumTypeEnumValues.map[json["album_type"]]!,
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        uri: json["uri"],
        artists: List<AddedBy>.from(json["artists"].map((x) => AddedBy.fromJson(x))),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        totalTracks: json["total_tracks"],
    );

    Map<String, dynamic> toJson() => {
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "type": albumTypeEnumValues.reverse[type],
        "album_type": albumTypeEnumValues.reverse[albumType],
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "uri": uri,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "external_urls": externalUrls.toJson(),
        "total_tracks": totalTracks,
    };
}

enum AlbumTypeEnum {
    ALBUM,
    COMPILATION,
    SINGLE
}

final albumTypeEnumValues = EnumValues({
    "album": AlbumTypeEnum.ALBUM,
    "compilation": AlbumTypeEnum.COMPILATION,
    "single": AlbumTypeEnum.SINGLE
});

class Image {
    final int height;
    final String url;
    final int width;

    Image({
        required this.height,
        required this.url,
        required this.width,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

enum ReleaseDatePrecision {
    DAY,
    YEAR
}

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY,
    "year": ReleaseDatePrecision.YEAR
});

class ExternalIds {
    final String isrc;

    ExternalIds({
        required this.isrc,
    });

    factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
    );

    Map<String, dynamic> toJson() => {
        "isrc": isrc,
    };
}

enum TrackType {
    TRACK
}

final trackTypeValues = EnumValues({
    "track": TrackType.TRACK
});

class VideoThumbnail {
    final dynamic url;

    VideoThumbnail({
        required this.url,
    });

    factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
