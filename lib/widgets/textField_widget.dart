import 'package:flutter_formulario/shared/responsive.dart';
import 'package:flutter_formulario/utils/global.dart';
import 'package:flutter/material.dart';

class TextFieldWidget  extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final Color? backgrounColor;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? isSuffixIcon;
  final bool? isPrefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? otherColor;
  final Color? color;
  final Color? borderColor;
  final int maxLong;
  final Color? textColor;
  final void Function()? onSuffixIconTap;
  final void Function()? onPrefixIconTap;
  final bool? isMaxLong;
  final bool? isFilled;
  final double borderRadius;
  final TextEditingController? controller;
  final bool? isMyController;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    this.hintText,
    this.maxLines,
    this.prefixIconData,
    this.suffixIconData,
    this.backgrounColor,
    this.borderRadius = 4.0,
    this.onChanged,
    this.obscureText = false,
    this.isSuffixIcon = false,
    this.isPrefixIcon = false,
    this.onTap,
    this.textColor,
    this.readOnly = false,
    this.otherColor = false,
    this.color = Global.colorEmpresa,
    this.borderColor,
    this.maxLong = 50,
    this.onSuffixIconTap,
    this.onPrefixIconTap,
    this.isMaxLong = false,
    this.isFilled = false,
    this.controller,
    this.isMyController = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSizeButton = 0;
    if(isTab(context) || isDesktop(context)){
      fontSizeButton = 20;
    }else if(isMobile(context)){
      fontSizeButton = 14;
    }

    return TextFormField(
      maxLength: isMaxLong == false ? null : maxLong,
      controller: isMyController == false ? null : controller,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly!,
      obscureText: obscureText!,
      cursorColor: color,
      style: TextStyle(
        color: textColor,
        fontSize: fontSizeButton
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: color
        ),
        focusColor: color,
        filled: isFilled,
        fillColor: backgrounColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor!
          ),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor!
          ),
        ),
        labelText: hintText,
        prefixIcon: isPrefixIcon == false ? null : GestureDetector(
          onTap: onPrefixIconTap,
          child: Icon(
            prefixIconData,
            size: 30,
            color: color
          ),
        ),         
        suffixIcon: isSuffixIcon == false ? null : GestureDetector(
          onTap: onSuffixIconTap,
          child: Icon(
            suffixIconData,
            size: 25,
            color: color
          ),
        )
      ),
    );
  }
}
