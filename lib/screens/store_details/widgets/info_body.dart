import 'package:dharvya_assignment/constants.dart';
import 'package:dharvya_assignment/models/store.dart';
import 'package:flutter/material.dart';

class StoreInfoBody extends StatelessWidget {
  const StoreInfoBody({Key? key, this.store}) : super(key: key);

  final Store? store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BASIC INFO:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: kDefaultPaddin / 2),
            Text(("${(store?.description)}")),
            const SizedBox(height: kDefaultPaddin * 2),
            const Text(
              'LOCATION:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: kDefaultPaddin / 2),
            Text(("${(store?.location)}")),
            const SizedBox(height: kDefaultPaddin),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://images.pexels.com/photos/269874/pexels-photo-269874.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
