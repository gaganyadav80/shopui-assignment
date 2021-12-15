import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/models/ratings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StoreReviewList extends StatefulWidget {
  const StoreReviewList({Key? key, required this.storeid}) : super(key: key);

  final String storeid;

  @override
  State<StoreReviewList> createState() => _StoreReviewListState();
}

class _StoreReviewListState extends State<StoreReviewList> {
  int sortby = 0;
  List<RatingModel> _ratingsList = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection(widget.storeid).snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return const CupertinoActivityIndicator();
        }
        _ratingsList = snapshot.data!.docs
            .map((snap) => RatingModel.fromSnapshot(snap))
            .toList();
        sort(sortby);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black12,
                  primary: Colors.black12,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(CupertinoIcons.sort_down_circle,
                        color: Colors.black),
                    const SizedBox(width: 8),
                    sortby == 0
                        ? const Text("High to Low",
                            style: TextStyle(color: Colors.black))
                        : const Text("Low to High",
                            style: TextStyle(color: Colors.black)),
                  ],
                ),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  builder: (context) {
                    return StoreReviewSortDialog(
                        decSortby: decSortby,
                        incSortby: incSortby,
                        sortBy: sortby);
                  },
                ),
              ),
            ),
            Column(
              children: List.generate(_ratingsList.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black45)),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.teal[800],
                            backgroundImage: const NetworkImage(
                              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPaddin / 1.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _ratingsList[index].name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(5, (starIdx) {
                                    int rating = _ratingsList[index].rating;
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 4.0, 8.0, 4.0),
                                      child: rating >= starIdx + 1
                                          ? const Icon(CupertinoIcons.star_fill,
                                              color: Colors.black)
                                          : const Icon(CupertinoIcons.star,
                                              color: Colors.black),
                                    );
                                  }),
                                ),
                                Text(DateFormat.yMMMd()
                                    .add_jm()
                                    .format(_ratingsList[index].date.toDate())),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          _ratingsList[index].review,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  void sort(int sortby) {
    if (sortby == 0) {
      _ratingsList.sort((a, b) => b.rating.compareTo(a.rating));
    } else {
      _ratingsList.sort((a, b) => a.rating.compareTo(b.rating));
    }
  }

  void incSortby() {
    setState(() {
      sortby = 0;
    });
  }

  void decSortby() {
    setState(() {
      sortby = 1;
    });
  }
}

class StoreReviewSortDialog extends StatefulWidget {
  const StoreReviewSortDialog(
      {Key? key,
      required this.decSortby,
      required this.incSortby,
      required this.sortBy})
      : super(key: key);

  final VoidCallback incSortby;
  final VoidCallback decSortby;
  final int sortBy;

  @override
  _StoreReviewSortDialogState createState() => _StoreReviewSortDialogState();
}

class _StoreReviewSortDialogState extends State<StoreReviewSortDialog> {
  int sortby = 0;
  @override
  void initState() {
    super.initState();
    sortby = widget.sortBy;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.0,
            child: TextButton(
              child: Text(
                "Done",
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green[100]),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          ListTile(
            title: const Text("Highest rated first"),
            trailing: sortby == 0
                ? const Icon(CupertinoIcons.check_mark, color: Colors.black)
                : const SizedBox.shrink(),
            onTap: () {
              setState(() {
                widget.incSortby();
                sortby = 0;
              });
            },
          ),
          ListTile(
            title: const Text("Lowest rated first"),
            trailing: sortby == 1
                ? const Icon(CupertinoIcons.check_mark, color: Colors.black)
                : const SizedBox.shrink(),
            onTap: () {
              setState(() {
                widget.decSortby();
                sortby = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
