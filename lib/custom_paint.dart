import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var rect = Offset.zero & size;
    // var gradient = const RadialGradient(
    //   center:  Alignment(0.7, -0.6),
    //   radius: 0.2,
    //   colors: [Color(0xFFFFFF00), Color(0xFF0099FF)],
    //   stops:  [0.4, 1.0],
    // );
    // canvas.drawRect(
    //   rect,
    //   Paint()..shader = gradient.createShader(rect),
    // );
    // 

    
    final height = size.height;
    final width = size.width;
        Path myPath = Path();
           Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Color(0xff404040);


    myPath.moveTo(width * 0.25, 0);
        myPath.quadraticBezierTo(
        width * 0.7, height * 0.15, width * 0.4, height * 0.3);
    myPath.quadraticBezierTo(
        width * 0.15, height * 0.45, width * 0.4, height * 0.65);

    canvas.drawPath(myPath, paint);
  }

  // @override
  // SemanticsBuilderCallback get semanticsBuilder {
  //   return (Size size) {
  //     var rect = Offset.zero & size;
  //     var width = size.shortestSide * 0.4;
  //     rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
  //     return [
  //       CustomPainterSemantics(
  //         rect: rect,
  //         properties: const SemanticsProperties(
  //           label: 'Sun',
  //           textDirection: TextDirection.ltr,
  //         ),
  //       ),
  //     ];
  //   };
  // }

  @override
  bool shouldRepaint(Sky oldDelegate) => false;
  // @override
  // bool shouldRebuildSemantics(Sky oldDelegate) => false;
}
