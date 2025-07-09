import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String category;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  String date;

  @HiveField(5)
  double lat;

  @HiveField(6)
  double long;

  @HiveField(7)
  bool isfavourite;


  @HiveField(8)
  String createdAt;




  Event({
   required this.createdAt, 
    this.isfavourite = false,
    this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toJson() {
    return {
      Keys.createdAt: createdAt,
      Keys.isFavourite: isfavourite,
      Keys.id: id,
      Keys.category: category,
      Keys.title: title,
      Keys.description: description,
      Keys.date: date,
      Keys.lat: lat,
      Keys.long: long,
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      createdAt: json[Keys.createdAt],
      isfavourite: json[Keys.isFavourite],
      id: json[ Keys.id],
      category: json[Keys.category],
      title: json[Keys.title],
      description: json[Keys.description],
      date: json[Keys.date],
      lat: (json[Keys.lat] as num).toDouble(),
      long: (json[Keys.long] as num).toDouble(),
    );
  }



  
}