import 'package:hive/hive.dart';

part 'login_response_model.g.dart';

@HiveType(typeId: 0)
class LoginResponseModel extends HiveObject {
  @HiveField(0)
  final String answer;

  @HiveField(1)
  final String supname;

  @HiveField(2)
  final List<LoginItem> items;

  LoginResponseModel({
    required this.answer,
    required this.supname,
    required this.items,
  });

  factory LoginResponseModel.fromJson(List<dynamic> json) {
    return LoginResponseModel(
      answer: json[0]['answer'] ?? '',
      supname: json[0]['supname'] ?? '',
      items: json.skip(1).map((e) => LoginItem.fromJson(e)).toList(),
    );
  }
}

@HiveType(typeId: 1)
class LoginItem extends HiveObject {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final String? type;

  @HiveField(2)
  final String? content;

  @HiveField(3)
  final String? action;

  @HiveField(4)
  final String? buttext;

  @HiveField(5)
  final String? cleft;

  @HiveField(6)
  final String? cright;

  @HiveField(7)
  final String? asol;

  @HiveField(8)
  final String? tval;

  LoginItem({
    this.title,
    this.type,
    this.content,
    this.action,
    this.buttext,
    this.cleft,
    this.cright,
    this.asol,
    this.tval,
  });

  factory LoginItem.fromJson(Map<String, dynamic> json) {
    return LoginItem(
      title: json['title'],
      type: json['type'],
      content: json['content'],
      action: json['action'],
      buttext: json['buttext'],
      cleft: json['cleft'],
      cright: json['cright'],
      asol: json['asol'],
      tval: json['tval'],
    );
  }
}
