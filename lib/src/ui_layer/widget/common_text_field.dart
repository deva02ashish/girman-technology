import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technology/src/data_layer/res/colors.dart';
import 'package:girman_technology/src/data_layer/res/style.dart';
import 'package:girman_technology/src/data_layer/res/text_style.dart';

class CommonTextField extends StatelessWidget {
  final int maxLines;
  final bool readonly;
  final Widget? suffix;
  final int? maxLength;
  final bool showCounter;
  final String? hintText;
  final bool showBorders;
  final bool? obscureText;
  final TextAlign textAlign;
  final String? prefixImage;
  final VoidCallback? onTap;
  final Widget? prefixWidget;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final VoidCallback? onVisibilityToggle;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final bool? isEnable;
  final TextStyle? hintStyle;
  final BoxConstraints? suffixBoxConstraints;
  final Color borderColor;
  final double borderRadius;
  final bool autoFocus;
  final TextStyle? style;
  final int minLines;
  final double? borderWidth;

  const CommonTextField({
    super.key,
    this.onTap,
    this.suffix,
    this.hintText,
    this.focusNode,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.prefixImage,
    this.obscureText,
    this.keyboardType,
    this.maxLines = 1,
    this.prefixWidget,
    this.contentPadding,
    this.textInputAction,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.readonly = false,
    this.onVisibilityToggle,
    this.controller,
    this.showCounter = false,
    this.showBorders = true,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.fillColor,
    this.isEnable = true,
    this.hintStyle,
    this.suffixBoxConstraints,
    this.borderColor = AppColors.cold7d,
    this.borderRadius = 10,
    this.autoFocus = false,
    this.style,
    this.minLines = 1,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.col000,
      autofocus: autoFocus,
      enabled: isEnable,
      onTap: onTap,
      readOnly: readonly,
      maxLines: maxLines,
      focusNode: focusNode,
      textAlign: textAlign,
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      minLines: minLines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization,
      style: style ?? AppTextStyles.inter13W500.copyWith(fontSize: 13.25.sp),
      decoration: InputDecoration(
        suffixIconConstraints: suffixBoxConstraints,
        hintText: hintText,
        hintStyle:
            hintStyle ?? AppTextStyles.inter13W500.copyWith(fontSize: 16.sp),
        errorMaxLines: 3,
        fillColor: fillColor,
        contentPadding: contentPadding ?? AppStyle.pdH20,
        counterText: showCounter ? null : '',
        suffixIcon: suffix,
        prefixIcon: prefixWidget,
        border: showBorders ? _lightThemeTextFieldBorder() : null,
        errorBorder: showBorders ? _lightThemeTextFieldBorder() : null,
        enabledBorder: showBorders ? _lightThemeTextFieldBorder() : null,
        focusedBorder: showBorders ? _lightThemeTextFieldBorder() : null,
        disabledBorder: showBorders ? _lightThemeTextFieldBorder() : null,
        focusedErrorBorder: showBorders ? _lightThemeTextFieldBorder() : null,
      ),
    );
  }

  /// text field border for light theme
  InputBorder _lightThemeTextFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth ?? 1,
      ),
    );
  }
}
