import 'package:cloud_firestore/cloud_firestore.dart';


class Movie{
  late final String title;
  late final String keyword;
  late final String poster;
  late final bool like;
  final DocumentReference reference;

  Movie.fromMap(Map<String,dynamic> map, {required this.reference}){
    title = map['title'];
    keyword = map['keyword'];
    poster = map['poster'];
    like = map['like']==true;

  }

  Movie.fromsnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>? ?? {}, reference: snapshot.reference);


  @override
    String toString() =>"Movie<$title:$keyword>";

}