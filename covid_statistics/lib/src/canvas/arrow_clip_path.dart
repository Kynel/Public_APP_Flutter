import 'package:flutter/cupertino.dart';

class ArrowClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  // 화면 변화시 clipper를 다시 그리는 옵션
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
