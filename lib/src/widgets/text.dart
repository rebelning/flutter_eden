import 'package:flutter_eden/eden.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final int? maxLines;
  final bool? center;
  final bool? underline;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final double? height;
  final double? fontSize;

  const TextWidget({
    Key? key,
    this.text = "",
    this.color,
    this.maxLines,
    this.center = true,
    this.underline,
    this.align,
    this.fontWeight,
    this.height,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textAlign: center == true ? TextAlign.center : align,
      style: TextStyle(
        decoration:
            underline == true ? TextDecoration.underline : TextDecoration.none,
        color: kIsDark == true ? titleColor : titleLightColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
