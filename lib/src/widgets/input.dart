import 'package:flutter_eden/eden.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.obscureText,
    this.inputFormatters,
    this.showBorder = true,
    this.borderWidth,
    this.borderColor,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintMaxLines = 1,
    this.height,
    this.autoFocus = false,
    this.maxLength,
    this.borderFocusColor,
    this.placeholder,
    this.placeholderStyle,
    this.contentPadding,
    this.textStyle,
    this.textAlign,
    this.suffix,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.onSubmitted,
    this.onChanged,
  }) : super(key: key);

  /// 输入框控制器
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? obscureText;

  /// 键盘类型
  final TextInputType? keyboardType;

  /// 用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。
  final List<TextInputFormatter>? inputFormatters;

  final bool? showBorder;

  /// 边框的宽度
  final double? borderWidth;

  /// 边框的颜色
  final Color? borderColor;

  /// 边框聚焦时候的颜色
  final Color? borderFocusColor;

  /// 输入框没有内容时候的占位内容
  final String? placeholder;

  /// 占位内容的文字样式
  final TextStyle? placeholderStyle;

  /// 输入框内边距
  final EdgeInsetsGeometry? contentPadding;

  /// 输入框文字样式
  final TextStyle? textStyle;

  /// 输入框的文字对齐方式
  final TextAlign? textAlign;

  /// 左侧内容
  final Widget? prefix;
  final Widget? prefixIcon;

  /// 右侧内容
  final Widget? suffix;
  final Widget? suffixIcon;

  ///最大行数
  final int maxLines;

  ///最小行数
  final int minLines;

  ///最大长度
  final int? maxLength;
  final int? hintMaxLines;
  final double? height;

  ///
  final bool autoFocus;

  /// 键盘右下角按钮显示的文字
  final TextInputAction? textInputAction;

  final Function? onSubmitted;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return maxLines == 1
        ? Container(
            alignment: Alignment.centerLeft,
            height: height ?? 80.rpx,
            child: textField(context),
          )
        : Container(
            alignment: Alignment.centerLeft,
            child: textField(context),
          );
  }

  ///textfield
  Widget textField(BuildContext context) => TextField(
        focusNode: focusNode,
        textAlign: textAlign ?? TextAlign.left,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        // cursorWidth: 1.0,
        autofocus: autoFocus,
        // 设置弹出键盘为亮色模式
        keyboardAppearance: Brightness.light,
        textInputAction: textInputAction ?? TextInputAction.done,
        inputFormatters: inputFormatters,

        decoration: InputDecoration(
          // filled: true,
          counterStyle: TextStyle(
            fontSize: 24.rpx,
            color: const Color(0xFFBEBEBE),
            height: 1.2,
          ),
          // 给输入框内容添加内边距可以使内容居中
          contentPadding: contentPadding ??
              EdgeInsets.fromLTRB(20.rpx, 0.rpx, 10.rpx, 0.rpx),
          // contentPadding: contentPadding ?? EdgeInsets.all(10.rpx),
          border: showBorder == false
              ? const OutlineInputBorder(borderSide: BorderSide.none)
              : null,
          // 可使用的边框
          enabledBorder: showBorder == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.rpx)),
                  borderSide: BorderSide(
                      // color: borderColor ?? rgba(217, 217, 217, 1),
                      color: borderColor ?? const Color(0xffd9d9d9),
                      width: borderWidth ?? 1.rpx),
                )
              : null,
          // 聚焦的边框
          focusedBorder: showBorder == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.rpx)),
                  borderSide: BorderSide(
                      color: borderFocusColor ?? const Color(0xff1077FE),
                      width: borderWidth ?? 1.rpx),
                )
              : null,
          // 没有内容时候的占位符与样式
          hintText: placeholder ?? "",
          hintStyle: placeholderStyle ??
              TextStyle(
                color: const Color(0xffB3B3B3),
                fontSize: 28.rpx,
                height: 1.2,
              ),
          // hintMaxLines: 1,
          hintMaxLines: hintMaxLines,
          suffix: suffix,
          prefix: prefixIcon == null ? prefix : null,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(
            maxWidth: 40.rpx,
            maxHeight: 40.rpx,
          ),
        ),

        // 输入框输入的内容的样式

        textAlignVertical: TextAlignVertical.center,
        style: textStyle ??
            TextStyle(
              color: kIsDark ? textFieldColor : textFieldLightColor,
              fontSize: 28.rpx,
            ),
        onSubmitted: (value) {
          if (onSubmitted != null) onSubmitted!(value);
        },
        onChanged: onChanged,
      );
}
