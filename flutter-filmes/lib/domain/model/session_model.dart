class SessionModel {
  SessionModel({
    this.id,
    this.email,
    this.senha,
  });

  int id;
  String email;
  String senha;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        senha: json["senha"] == null ? null : json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
      };
}
