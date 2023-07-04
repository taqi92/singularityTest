class AttendanceResponse {
  final int? code;
  final String? appMessage;
  final String? userMessage;
  final Data? data;

  AttendanceResponse({
    this.code,
    this.appMessage,
    this.userMessage,
    this.data,
  });

  AttendanceResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        appMessage = json['app_message'] as String?,
        userMessage = json['user_message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'app_message' : appMessage,
    'user_message' : userMessage,
    'data' : data?.toJson()
  };
}

class Data {
  final String? name;
  final String? uid;
  final String? latitude;
  final String? longitude;
  final String? requestId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.name,
    this.uid,
    this.latitude,
    this.longitude,
    this.requestId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        uid = json['uid'] as String?,
        latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?,
        requestId = json['request_id'] as String?,
        updatedAt = json['updated_at'] as String?,
        createdAt = json['created_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'uid' : uid,
    'latitude' : latitude,
    'longitude' : longitude,
    'request_id' : requestId,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}