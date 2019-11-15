import 'dart:async';
import 'dart:ui' as ui;
import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:qr/qr.dart';

import 'package:flutter/services.dart';

class QrImage extends StatelessWidget {
  QrImage({
    @required String data,
    this.size,
    this.padding = const EdgeInsets.all(10.0),
    this.backgroundColor,
    Color foregroundColor = BeepColors.quaternary,
    int version = 2,
    int errorCorrectionLevel = QrErrorCorrectLevel.Q,
    this.onError,
    this.gapless = false,
  }) : _painter = _QrPainter(
          data: data,
          color: foregroundColor,
          version: version,
          errorCorrectionLevel: errorCorrectionLevel,
          gapless: gapless,
          onError: onError,
        );

  final _QrPainter _painter;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double size;
  final QrError onError;
  final bool gapless;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double widgetSize = size ?? constraints.biggest.shortestSide;
        return Container(
          width: widgetSize,
          height: widgetSize,
          color: backgroundColor,
          child: Padding(
            padding: padding,
            child: CustomPaint(
              painter: _painter,
            ),
          ),
        );
      },
    );
  }
}

typedef QrError = void Function(dynamic error);

class _QrPainter extends CustomPainter {
  _QrPainter({
    @required String data,
    @required this.version,
    this.errorCorrectionLevel = QrErrorCorrectLevel.L,
    this.color = BeepColors.black,
    this.emptyColor,
    this.onError,
    this.gapless = false,
  }) : _qr = QrCode(version, errorCorrectionLevel) {
    _init(data);
  }

  final int version; // the qr code version
  final int errorCorrectionLevel; // the qr code error correction level
  final Color color; // the color of the dark squares
  final Color emptyColor; // the other color
  final QrError onError;
  final bool gapless;

  final QrCode _qr; // our qr code data
  final Paint _paint = Paint()..style = PaintingStyle.fill;
  bool _hasError = false;

  void _init(String data) {
    _paint.color = color;
    // configure and make the QR code data
    try {
      _qr.addData(data);
      _qr.make();
    } catch (ex) {
      if (onError != null) {
        _hasError = true;
        onError(ex);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_hasError) {
      return;
    }
    if (size.shortestSide == 0) {
      print(
          "[QR] WARN: width or height is zero. You should set a 'size' value or nest this painter in a Widget that defines a non-zero size");
    }

    if (emptyColor != null) {
      canvas.drawColor(emptyColor, BlendMode.color);
    }

    final double squareSize = size.shortestSide / _qr.moduleCount.toDouble();
    final int pxAdjustValue = gapless ? 1 : 0;
    for (int x = 0; x < _qr.moduleCount; x++) {
      for (int y = 0; y < _qr.moduleCount; y++) {
        if (_qr.isDark(y, x)) {
          final Rect squareRect = Rect.fromLTWH(x * squareSize, y * squareSize,
              squareSize + pxAdjustValue, squareSize + pxAdjustValue);
          canvas.drawRect(squareRect, _paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is _QrPainter) {
      return color != oldDelegate.color ||
          errorCorrectionLevel != oldDelegate.errorCorrectionLevel ||
          version != oldDelegate.version ||
          _qr != oldDelegate._qr;
    }
    return false;
  }

  ui.Picture toPicture(double size) {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    paint(canvas, Size(size, size));
    return recorder.endRecording();
  }

  Future<ByteData> toImageData(double size,
      {ui.ImageByteFormat format = ui.ImageByteFormat.png}) async {
    final ui.Image uiImage =
        await toPicture(size).toImage(size.toInt(), size.toInt());
    return await uiImage.toByteData(format: format);
  }
}
