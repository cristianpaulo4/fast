String session_model_template = """
import 'dart:convert';

class SessionModel {
  int? id;
  int? id_user;
  int? name;
  int? url_image;
  String? token;
  SessionModel({
    this.id,
    this.id_user,
    this.name,
    this.url_image,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_user': id_user,
      'name': name,
      'url_image': url_image,
      'token': token,
    };
  }

  factory SessionModel.fromMap(Map<String, dynamic> map) {
    return SessionModel(
      id: map['id'] != null ? map['id'] as int : null,
      id_user: map['id_user'] != null ? map['id_user'] as int : null,
      name: map['name'] != null ? map['name'] as int : null,
      url_image: map['url_image'] != null ? map['url_image'] as int : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionModel.fromJson(String source) => SessionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

""";