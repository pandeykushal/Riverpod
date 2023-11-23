import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String? status;
  int? code;
  String? message;
  dynamic extraInfo;
  LoginResults? results;

  Login({
    this.status,
    this.code,
    this.message,
    this.extraInfo,
    this.results,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        extraInfo: json["extraInfo"],
        results: json["results"] == null
            ? null
            : LoginResults.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "extraInfo": extraInfo,
        "results": results?.toJson(),
      };
}

class LoginResults {
  The0? the0;
  String? code;
  String? accessToken;
  int? userId;
  String? email;
  String? mobile;
  dynamic mobileNtc;
  String? createdAt;
  String? updatedAt;
  String? roleId;
  String? roleText;
  String? avatar;
  The0? packages;
  dynamic appVersion;
  String? platform;
  String? message;

  LoginResults({
    this.the0,
    this.code,
    this.accessToken,
    this.userId,
    this.email,
    this.mobile,
    this.mobileNtc,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.roleText,
    this.avatar,
    this.packages,
    this.appVersion,
    this.platform,
    this.message,
  });

  factory LoginResults.fromJson(Map<String, dynamic> json) => LoginResults(
        the0: json["0"] == null ? null : The0.fromJson(json["0"]),
        code: json["code"],
        accessToken: json["access_token"],
        userId: json["user_id"],
        email: json["email"],
        mobile: json["mobile"],
        mobileNtc: json["mobile_ntc"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        roleId: json["role_id"],
        roleText: json["role_text"],
        avatar: json["avatar"],
        packages:
            json["packages"] == null ? null : The0.fromJson(json["packages"]),
        appVersion: json["app_version"],
        platform: json["platform"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0?.toJson(),
        "code": code,
        "access_token": accessToken,
        "user_id": userId,
        "email": email,
        "mobile": mobile,
        "mobile_ntc": mobileNtc,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "role_id": roleId,
        "role_text": roleText,
        "avatar": avatar,
        "packages": packages?.toJson(),
        "app_version": appVersion,
        "platform": platform,
        "message": message,
      };
}

class The0 {
  Karaoke? song;
  Karaoke? karaoke;

  The0({
    this.song,
    this.karaoke,
  });

  factory The0.fromJson(Map<String, dynamic> json) => The0(
        song: json["song"] == null ? null : Karaoke.fromJson(json["song"]),
        karaoke:
            json["karaoke"] == null ? null : Karaoke.fromJson(json["karaoke"]),
      );

  Map<String, dynamic> toJson() => {
        "song": song?.toJson(),
        "karaoke": karaoke?.toJson(),
      };
}

class Karaoke {
  int? packageId;
  String? packageName;
  DateTime? expiry;
  int? isActive;

  Karaoke({
    this.packageId,
    this.packageName,
    this.expiry,
    this.isActive,
  });

  factory Karaoke.fromJson(Map<String, dynamic> json) => Karaoke(
        packageId: json["package_id"],
        packageName: json["package_name"],
        expiry: json["expiry"] == null ? null : DateTime.parse(json["expiry"]),
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "package_name": packageName,
        "expiry":
            "${expiry!.year.toString().padLeft(4, '0')}-${expiry!.month.toString().padLeft(2, '0')}-${expiry!.day.toString().padLeft(2, '0')}",
        "is_active": isActive,
      };
}
