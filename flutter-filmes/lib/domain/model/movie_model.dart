class MovieModel {
  MovieModel({this.id, this.name, this.year, this.image, this.genre});

  int id;
  String name;
  String year;
  String image;
  String genre;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        year: json["year"] == null ? null : json["year"],
        image: json["image"] == null ? null : json["image"],
        genre: json["genre"] == null ? null : json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "year": year == null ? null : year,
        "image": image == null ? null : image,
        "genre": genre == null ? null : genre
      };
}
