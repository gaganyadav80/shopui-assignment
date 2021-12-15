import 'package:dharvya_assignment/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CartCounter(),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: const Center(
              child: Icon(CupertinoIcons.heart, color: Colors.black)),
        )
      ],
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
