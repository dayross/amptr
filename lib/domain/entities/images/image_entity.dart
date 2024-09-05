class ImageEntity {
    String id;
    dynamic title;
    dynamic description;
    int datetime;
    String type;
    bool animated;
    int width;
    int height;
    int size;
    int views;
    int bandwidth;
    dynamic vote;
    bool favorite;
    dynamic nsfw;
    dynamic section;
    dynamic accountUrl;
    dynamic accountId;
    bool isAd;
    bool inMostViral;
    bool hasSound;
    List<dynamic> tags;
    int adType;
    String adUrl;
    String edited;
    bool inGallery;
    String link;

    ImageEntity({
        required this.id,
        required this.title,
        required this.description,
        required this.datetime,
        required this.type,
        required this.animated,
        required this.width,
        required this.height,
        required this.size,
        required this.views,
        required this.bandwidth,
        required this.vote,
        required this.favorite,
        required this.nsfw,
        required this.section,
        required this.accountUrl,
        required this.accountId,
        required this.isAd,
        required this.inMostViral,
        required this.hasSound,
        required this.tags,
        required this.adType,
        required this.adUrl,
        required this.edited,
        required this.inGallery,
        required this.link,
    });

    ImageEntity copyWith({
        String? id,
        dynamic title,
        dynamic description,
        int? datetime,
        String? type,
        bool? animated,
        int? width,
        int? height,
        int? size,
        int? views,
        int? bandwidth,
        dynamic vote,
        bool? favorite,
        dynamic nsfw,
        dynamic section,
        dynamic accountUrl,
        dynamic accountId,
        bool? isAd,
        bool? inMostViral,
        bool? hasSound,
        List<dynamic>? tags,
        int? adType,
        String? adUrl,
        String? edited,
        bool? inGallery,
        String? link,
    }) => 
        ImageEntity(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
            datetime: datetime ?? this.datetime,
            type: type ?? this.type,
            animated: animated ?? this.animated,
            width: width ?? this.width,
            height: height ?? this.height,
            size: size ?? this.size,
            views: views ?? this.views,
            bandwidth: bandwidth ?? this.bandwidth,
            vote: vote ?? this.vote,
            favorite: favorite ?? this.favorite,
            nsfw: nsfw ?? this.nsfw,
            section: section ?? this.section,
            accountUrl: accountUrl ?? this.accountUrl,
            accountId: accountId ?? this.accountId,
            isAd: isAd ?? this.isAd,
            inMostViral: inMostViral ?? this.inMostViral,
            hasSound: hasSound ?? this.hasSound,
            tags: tags ?? this.tags,
            adType: adType ?? this.adType,
            adUrl: adUrl ?? this.adUrl,
            edited: edited ?? this.edited,
            inGallery: inGallery ?? this.inGallery,
            link: link ?? this.link,
        );

    factory ImageEntity.fromJson(Map<String, dynamic> json) => ImageEntity(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        datetime: json["datetime"],
        type: json["type"],
        animated: json["animated"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
        views: json["views"],
        bandwidth: json["bandwidth"],
        vote: json["vote"],
        favorite: json["favorite"],
        nsfw: json["nsfw"],
        section: json["section"],
        accountUrl: json["account_url"],
        accountId: json["account_id"],
        isAd: json["is_ad"],
        inMostViral: json["in_most_viral"],
        hasSound: json["has_sound"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        adType: json["ad_type"],
        adUrl: json["ad_url"],
        edited: json["edited"],
        inGallery: json["in_gallery"],
        link: json["link"],
    );

    
}
