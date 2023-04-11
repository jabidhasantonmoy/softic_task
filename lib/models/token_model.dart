class TokenModel {
  TokenModel({
    this.idToken,
  });

  TokenModel.fromJson(dynamic json) {
    idToken = json['id_token'];
  }
  String? idToken;
  TokenModel copyWith({
    String? idToken,
  }) =>
      TokenModel(
        idToken: idToken ?? this.idToken,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_token'] = idToken;
    return map;
  }
}
