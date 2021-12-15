import 'package:firebase_storage/firebase_storage.dart';

class ReviewImage {
  final Reference ref;
  final String name;
  final String url;

  const ReviewImage({
    required this.ref,
    required this.name,
    required this.url,
  });
}

class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<ReviewImage>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.fullPath; //gets parents name -> idk why -> userid
          final file = ReviewImage(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  // static Future downloadFile(Reference ref) async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   final file = File('${dir.path}/${ref.name}');

  //   await ref.writeToFile(file);
  // }
}

void deleteImages(String sid, String uid) async {
  Reference ref = FirebaseStorage.instance.ref().child('/$sid/$uid/');
  ref.listAll().then((ListResult value) {
    for (var element in value.items) {
      element.delete();
    }
  });
}
