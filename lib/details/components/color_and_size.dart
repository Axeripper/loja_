import 'package:flutter/material.dart';
import '../../home/containts.dart';

// ignore: must_be_immutable
class ColorAndSize extends StatelessWidget {
  ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Color"),
              Row(
                children: const <Widget>[
                  ColorDot(
                    color: Color.fromARGB(255, 60, 3, 87),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFF8C078)),
                  ColorDot(color: Color(0xFFA29B9B)),
                ],
              ),
            ],
          ),
        ),
        Size(product: product),
      ],
    );
  }
}

class Size extends StatefulWidget {
  const Size({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Map<String, dynamic> product;

  @override
  State<Size> createState() => _SizeState();
}

class _SizeState extends State<Size> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "Size\n"),
              ],
            ),
          ),
        ),
        Text(
          "${widget.product['size']} cm",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
