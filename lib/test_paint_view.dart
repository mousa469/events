import 'package:flutter/material.dart';

class TestPaintView extends StatelessWidget {
  const TestPaintView({super.key});
  static const String id = "test Paint view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test paint ")),
      body: CustomPaint(
        painter: ShapePainter(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text("mousa")],
          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();

    path.moveTo(size.width, size.height / 2);
    path.quadraticBezierTo(
      size.width - 5,
      size.height - 272,
      size.width - 20,
      size.height - 270,
    );
    path.moveTo(size.width - 20, size.height - 270);
    path.quadraticBezierTo(
      size.width - 60,
      size.height - 260,
      size.width - 60,
      size.height - 230,
    );
    path.moveTo(size.width - 60, size.height - 230);
    path.quadraticBezierTo(
      size.width - 60,
      size.height - 200,
      size.width - 20,
      size.height - 200,
    );
    path.moveTo(size.width - 20, size.height - 200);

    path.quadraticBezierTo(
      size.width - 5,
      size.height - 200,
      size.width,
      size.height - 190,
    );

    // var circlePaint = Paint()
    //   ..color = Colors.blueAccent
    //   ..strokeWidth = 3;

    // var circlePosition = Offset(size.width, size.height - 190);

    canvas.drawPath(path, paint);
    // canvas.drawCircle(circlePosition, 5, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class ShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.teal
//       ..strokeWidth = 5
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     var path = Path();
//     path.moveTo(0, size.height / 2);
//     path.lineTo(size.width, size.height / 2);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class ShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.yellow
//       ..style = PaintingStyle.fill;

//     final path = Path();

//     // Start at top-right
//     path.moveTo(size.width, size.height * .8);

//     // Top curve toward center
//     path.quadraticBezierTo(
//       //// handle point
//       size.width * .5,
//       size.height * .9,

//       ///// end point
//       size.width,
//       size.height - 20,
//     );

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
