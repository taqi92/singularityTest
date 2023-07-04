class StoreResponse {
  final List<Data>? data;
  final Links? links;
  final Meta? meta;

  StoreResponse({
    this.data,
    this.links,
    this.meta,
  });

  StoreResponse.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
        meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList(),
    'links' : links?.toJson(),
    'meta' : meta?.toJson()
  };
}

class Data {
  final int? id;
  final String? name;
  final String? address;

  Data({
    this.id,
    this.name,
    this.address,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        address = json['address'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'address' : address
  };
}

class Links {
  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links.fromJson(Map<String, dynamic> json)
      : first = json['first'] as String?,
        last = json['last'] as String?,
        prev = json['prev'],
        next = json['next'] as String?;

  Map<String, dynamic> toJson() => {
    'first' : first,
    'last' : last,
    'prev' : prev,
    'next' : next
  };
}

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
    'current_page' : currentPage,
    'from' : from,
    'last_page' : lastPage,
    'path' : path,
    'per_page' : perPage,
    'to' : to,
    'total' : total
  };
}