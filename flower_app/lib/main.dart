// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Interactive Flower Pattern'),
//         ),
//         body: Center(
//           child: InteractiveFlower(),
//         ),
//       ),
//     );
//   }
// }

// class InteractiveFlower extends StatefulWidget {
//   @override
//   _InteractiveFlowerState createState() => _InteractiveFlowerState();
// }

// class _InteractiveFlowerState extends State<InteractiveFlower> {
//   List<bool> _petalVisible = [];
//   int _numPetals = 12;
//   String _loveText = '';

//   @override
//   void initState() {
//     super.initState();
//     _resetPetals();
//   }

//   void _resetPetals() {
//     setState(() {
//       _petalVisible = List<bool>.filled(_numPetals, true);
//       _loveText = '';
//     });
//   }

//   void _onTapDown(TapDownDetails details) {
//     final position = details.localPosition;
//     final size = Size(300, 300);
//     final radius = size.width / 3;
//     final center = Offset(size.width / 2, size.height / 2);

//     for (int i = 0; i < _numPetals; i++) {
//       final angle = (2 * pi / _numPetals) * i;
//       final x = center.dx + radius * cos(angle);
//       final y = center.dy + radius * sin(angle);
//       final petalRect = Rect.fromCenter(
//         center: Offset(x, y),
//         width: radius,
//         height: radius / 2,
//       );

//       if (petalRect.contains(position) && _petalVisible[i]) {
//         setState(() {
//           _petalVisible[i] = false;
//           _loveText = (Random().nextBool()) ? 'Love' : 'Don\'t Love';
//           if (_petalVisible.every((element) => !element)) {
//             // All petals are invisible, no action needed here for auto-reset
//           }
//         });
//         break;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Love Check',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           'Tap on petals to remove it',
//           style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//         ),
//         SizedBox(height: 20),
//         GestureDetector(
//           onTapDown: _onTapDown,
//           child: CustomPaint(
//             size: Size(300, 300),
//             painter: FlowerPainter(_petalVisible),
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           _loveText,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: _resetPetals,
//           child: Text('Restart Game'),
//         ),
//       ],
//     );
//   }
// }

// class FlowerPainter extends CustomPainter {
//   final List<bool> petalVisible;

//   FlowerPainter(this.petalVisible);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     final numPetals = 12;
//     final radius = size.width / 3;
//     final center = Offset(size.width / 2, size.height / 2);

//     for (int i = 0; i < numPetals; i++) {
//       if (!petalVisible[i]) continue;

//       final angle = (2 * pi / numPetals) * i;
//       final x = center.dx + radius * cos(angle);
//       final y = center.dy + radius * sin(angle);

//       paint.color = Color.fromARGB(
//         255,
//         (sin(i) * 127.5 + 127.5).toInt(),
//         (sin(i + 2 * pi / 3) * 127.5 + 127.5).toInt(),
//         (sin(i + 4 * pi / 3) * 127.5 + 127.5).toInt(),
//       );

//       canvas.save();
//       canvas.translate(center.dx, center.dy);
//       canvas.rotate(angle);
//       canvas.drawOval(
//         Rect.fromCenter(
//             center: Offset(radius / 2, 0), width: radius, height: radius / 2),
//         paint,
//       );
//       canvas.restore();
//     }

//     // Draw center circle
//     paint.color = Colors.white;
//     canvas.drawCircle(center, 10, paint);
//     paint.color = Colors.black;
//     canvas.drawCircle(center, 5, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Interactive Flower Pattern'),
        ),
        body: Center(
          child: InteractiveFlower(),
        ),
      ),
    );
  }
}

class InteractiveFlower extends StatefulWidget {
  @override
  _InteractiveFlowerState createState() => _InteractiveFlowerState();
}

class _InteractiveFlowerState extends State<InteractiveFlower> {
  List<bool> _petalVisible = [];
  int _numPetals = 12;
  String _loveText = '';

  @override
  void initState() {
    super.initState();
    _resetPetals();
  }

  void _resetPetals() {
    setState(() {
      _petalVisible = List<bool>.filled(_numPetals, true);
      _loveText = '';
    });
  }

  void _onTapDown(TapDownDetails details) {
    final position = details.localPosition;
    final size = Size(300, 300);
    final radius = size.width / 3;
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < _numPetals; i++) {
      final angle = (2 * pi / _numPetals) * i;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      final petalRect = Rect.fromCenter(
        center: Offset(x, y),
        width: radius,
        height: radius / 2,
      );

      if (petalRect.contains(position) && _petalVisible[i]) {
        setState(() {
          _petalVisible[i] = false;
          _loveText = (Random().nextBool()) ? 'Love' : 'Doesn\'t Love';
          if (_petalVisible.every((element) => !element)) {
            _loveText += '\nTap restart to play again.';
          }
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Love Check',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Tap on petals to remove it',
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTapDown: _onTapDown,
          child: CustomPaint(
            size: Size(300, 300),
            painter: FlowerPainter(_petalVisible),
          ),
        ),
        SizedBox(height: 20),
        Text(
          _loveText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _resetPetals,
          child: Text('Restart Game'),
        ),
      ],
    );
  }
}

class FlowerPainter extends CustomPainter {
  final List<bool> petalVisible;

  FlowerPainter(this.petalVisible);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final numPetals = 12;
    final radius = size.width / 3;
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < numPetals; i++) {
      if (!petalVisible[i]) continue;

      final angle = (2 * pi / numPetals) * i;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      paint.color = Color.fromARGB(
        255,
        (sin(i) * 127.5 + 127.5).toInt(),
        (sin(i + 2 * pi / 3) * 127.5 + 127.5).toInt(),
        (sin(i + 4 * pi / 3) * 127.5 + 127.5).toInt(),
      );

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(angle);
      canvas.drawOval(
        Rect.fromCenter(
            center: Offset(radius / 2, 0), width: radius, height: radius / 2),
        paint,
      );
      canvas.restore();
    }

    // Draw center circle (white only)
    paint.color = Colors.white;
    canvas.drawCircle(center, 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
