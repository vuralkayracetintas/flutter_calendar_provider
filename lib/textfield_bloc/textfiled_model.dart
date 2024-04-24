// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TextFieldModel {
  final String name;
  final String title;
  final String domain;

  TextFieldModel(
      {required this.name, required this.title, required this.domain});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'domain': domain,
    };
  }

  factory TextFieldModel.fromMap(Map<String, dynamic> map) {
    return TextFieldModel(
      name: map['name'] as String,
      title: map['title'] as String,
      domain: map['domain'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextFieldModel.fromJson(String source) =>
      TextFieldModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
