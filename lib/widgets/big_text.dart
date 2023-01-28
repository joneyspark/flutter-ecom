import 'package:flut_e_shop/utils/dimentions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.overFlow = TextOverflow.ellipsis,
    this.size = 0,
  });

  final String text;
  Color? color;
  TextOverflow overFlow;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimentions.font20 : size,
      ),
    );
  }
}
