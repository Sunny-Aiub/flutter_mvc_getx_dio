import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/color_theme.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  final InputBorder? focusedBorder;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  const InputFieldWidget(
      {Key? key,
      required this.controller,
      required this.isEnabled,
      this.backgroundColor,
      this.focusNode,
      this.border,
      this.prefixIcon,
      this.hintText,
      this.onChanged,
      this.suffixIcon,
      this.obscureText,
      this.focusedBorder,
      this.keyboardType,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 56,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: (focusNode?.hasFocus == true)
              ? [
                  BoxShadow(
                    color: ThemeColor.shadowColor,
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  )
                ]
              : null
          // border:  (focusedBorder != null)? null :border
          ),
      child: TextFormField(
        controller: controller,
        cursorColor: ThemeColor.primary700,
        onChanged: onChanged,
        validator: validator,
        enabled: isEnabled,
        keyboardType: keyboardType ?? TextInputType.text,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: ThemeColor.gray500),
        decoration: InputDecoration(
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: ThemeColor.gray300)),
          enabledBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: ThemeColor.gray300)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14),
          hintStyle: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: ThemeColor.gray500),
          hintText: hintText ?? "Search here",
          // hintStyle: getRegularStyle(
          //     fontSize: 14,color: ColorManager.gray400
          // )
        ),
      ),
    );
  }
}
