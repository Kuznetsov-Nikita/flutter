// Задание 1
import 'dart:ui';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

typedef PainterPoint = Offset;

class PainterCurve {
  final List<PainterPoint> points;
  final Paint paint;

  const PainterCurve({required this.points, required this.paint});
}

class PainterPage extends StatefulWidget {
  const PainterPage({super.key});

  @override
  State<PainterPage> createState() => _PainterPageState();
}

class _PainterPageState extends State<PainterPage> {
  Color _brushColor = Colors.red;
  double _brushWidth = 5;
  final List<PainterCurve> _curves = [];

  void _setBrushColor(Color newColor) {
    setState(() {
      _brushColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanStart: (details) => setState(() {
                _curves.add(
                  PainterCurve(
                    points: [details.localPosition], 
                    paint: Paint()
                      ..color = _brushColor
                      ..isAntiAlias = true
                      ..strokeWidth = _brushWidth
                      ..strokeCap = StrokeCap.round,
                  ),
                );
              }),
              onPanUpdate: (details) => setState(() {
                _curves.last.points.add(details.localPosition);
              }),
              child: CustomPaint(
                painter: _PainterPagePainter(curves: _curves),
                child: Container(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Slider(
                  min: 1,
                  max: 50,
                  value: _brushWidth,
                  onChanged: (value) => setState(() {
                    _brushWidth = value;
                  }),
                ),
              ),
              IconButton(
                onPressed: () async =>
                  _setBrushColor(await showColorPickerDialog(context, _brushColor)),
                icon: Icon(
                  Icons.brush,
                  color: _brushColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_curves.isNotEmpty) {
                    setState(() {
                      _curves.removeLast();
                    });
                  }
                },
                icon: const Icon(
                  Icons.undo,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                onPressed: () => setState(() {
                  _curves.clear();
                }),
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PainterPagePainter extends CustomPainter {
  final List<PainterCurve> curves;

  const _PainterPagePainter({this.curves = const []});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < curves.length; ++i) {
      if (curves[i].points.isEmpty) {
        continue;
      }
      final points = curves[i].points;
      for (int j = 0; j < points.length - 1; ++j) {
          canvas.drawLine(points[j], points[j + 1], curves[i].paint);
      }
      canvas.drawPoints(PointMode.points, [points.last], curves[i].paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
