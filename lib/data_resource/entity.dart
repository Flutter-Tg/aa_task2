class DataEntity {
  final int id;
  final String title;

  DataEntity({
    required this.id,
    required this.title,
  });

  factory DataEntity.fromJson(dynamic json){
    return DataEntity(
      id: json['id'],
      title: json['title'] + " : " + json['description'],
    );
  }
}
