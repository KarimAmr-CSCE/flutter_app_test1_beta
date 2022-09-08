import 'dart:convert';

// Breed List Object
List<Breed> breedFromJson(String str) => List<Breed>.from(json.decode(str).map((x) => Breed.fromJson(x)));

String breedToJson(List<Breed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Breed {
  Breed({
    required this.image,
    required this.name,
  });

  Image image;
  String name;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
    image: Image.fromJson(json["image"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "image": image.toJson(),
    "name": name,
  };

  String userAsString() {
    return '$name';
  }

  ///this method will prevent the override of toString
  bool filterBreedItem(String filter) {
    var nam = name.toUpperCase();
    return nam.contains(filter.toUpperCase());
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(Breed m) {
    return name == m.name;
  }

  @override
  String toString() => name;
}

class Image {
  Image({
    required this.height,
    required this.id,
    required this.url,
    required this.width,
  });

  int height;
  String id;
  String url;
  int width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    height: json["height"],
    id: json["id"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "id": id,
    "url": url,
    "width": width,
  };
}


// end of breed list obj

// To parse this JSON data, do
//

//     final photoResponse = photoResponseFromJson(jsonString);

// Photo  analysis response object
PhotoResponse photoResponseFromJson(String str) => PhotoResponse.fromJson(json.decode(str));

String photoResponseToJson(PhotoResponse data) => json.encode(data.toJson());

class PhotoResponse {
  PhotoResponse({
    required this.id,
    required this.url,
    required this.subId,
    required this.originalFilename,
    required this.pending,
    required this.approved,
  });

  String id;
  String url;
  String subId;
  String originalFilename;
  int pending;
  int approved;

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => PhotoResponse(
    id: json["id"],
    url: json["url"],
    subId: json["sub_id"],
    originalFilename: json["original_filename"],
    pending: json["pending"],
    approved: json["approved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "sub_id": subId,
    "original_filename": originalFilename,
    "pending": pending,
    "approved": approved,
  };
}
