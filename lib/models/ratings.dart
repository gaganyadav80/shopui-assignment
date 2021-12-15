import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel extends Equatable {
  final String uid;
  final String name;
  final int rating;
  final Timestamp date;
  final String review;
  // final List<String> imageURL;

  const RatingModel({
    required this.uid,
    required this.name,
    required this.rating,
    required this.date,
    required this.review,
    // required this.imageURL,
  });

  @override
  List<Object> get props => [uid, name, rating, date, review];

  @override
  int get hashCode =>
      uid.hashCode ^
      name.hashCode ^
      rating.hashCode ^
      date.hashCode ^
      review.hashCode;
  // imageURL.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingModel &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          name == other.name &&
          rating == other.rating &&
          date == other.date &&
          // imageURL == other.imageURL &&
          review == other.review;

  @override
  String toString() {
    return 'RatingModel { uid: $uid, name: $name, rating: $rating, date: $date, review: $review }';
  }

  static RatingModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    return RatingModel(
      uid: snap.data()?['uid'] as String,
      name: snap.data()?['name'] as String,
      rating: snap.data()?['rating'] as int,
      date: snap.data()?['date'] as Timestamp,
      review: snap.data()?['review'] as String,
      // imageURL: snap.data()?['imageURL'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "uid": uid,
      "name": name,
      "rating": rating,
      "date": date,
      "review": review,
      // "imageURL": imageURL,
    };
  }
}
