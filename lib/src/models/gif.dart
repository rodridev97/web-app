import 'dart:convert';

GiphyModel giphyModelFromJson(String str) =>
    GiphyModel.fromJson(json.decode(str));

String giphyModelToJson(GiphyModel data) => json.encode(data.toJson());

class GiphyModel {
  GiphyModel({
    this.type,
    this.id,
    this.username,
    required this.images,
  });

  String? type;
  String? id;
  String? username;
  Images images;

  factory GiphyModel.fromJson(Map<String, dynamic> json) => GiphyModel(
        type: json["type"],
        id: json["id"],
        username: json["username"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "username": username,
        "images": images.toJson(),
      };
}

class Images {
  Images({
    required this.original,
  });

  Original original;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: Original.fromJson(json["original"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original.toJson(),
      };
}

class Original {
  Original({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
        "mp4_size": mp4Size,
        "mp4": mp4,
        "webp_size": webpSize,
        "webp": webp,
        "frames": frames,
        "hash": hash,
      };
}
