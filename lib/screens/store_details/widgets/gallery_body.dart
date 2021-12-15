import 'package:dharvya_assignment/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreGalleryBody extends StatefulWidget {
  const StoreGalleryBody({Key? key}) : super(key: key);

  @override
  State<StoreGalleryBody> createState() => _StoreGalleryBodyState();
}

class _StoreGalleryBodyState extends State<StoreGalleryBody> {
  final List<String> _storeGalleryImage = <String>[
    'assets/images/store1.png',
    'assets/images/store2.png',
    'assets/images/store3.png',
    'assets/images/store4.png',
    'assets/images/store5.png',
    'assets/images/store1.png',
    'assets/images/store2.png',
    'assets/images/store3.png',
    'assets/images/store4.png',
    'assets/images/store5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(kDefaultPaddin),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 2.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.black87,
              builder: (context) {
                return StoreViewGalleryItem(
                    imagePath: _storeGalleryImage[index]);
              }),
          child: GridTile(
            child: Material(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              clipBehavior: Clip.antiAlias,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(_storeGalleryImage[index]),
              ),
            ),
            footer: Material(
              color: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8.0)),
              ),
              clipBehavior: Clip.antiAlias,
              child: GridTileBar(
                backgroundColor: Colors.black45,
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('${12 + index}/12/2020'),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StoreViewGalleryItem extends StatelessWidget {
  const StoreViewGalleryItem({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.clear),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        Center(
          child: Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
