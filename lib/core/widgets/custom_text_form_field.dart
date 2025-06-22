import 'package:events/core/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final String? hint;
  final String? label;
  final bool? enabled;
  final TextStyle? textStyle;
  final int? maxLines, minLines, maxLength;
  final String? obscuringCharacter, value;
  final String? Function(String?)? onValidate;
  final void Function(String?)? onChanged, onFieldSubmitted, onSaved;
  final void Function()? onEditingComplete, onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget, prefixIcon;
  final IconData? icon;
  final TextInputAction? action;
  final FocusNode? focusNode;
  // final Color? hintColor;
  final TextDirection? textDirection;
  final EdgeInsets? edgeInsets;
  final Color? focusBorderColor;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? errorBorderColor;
  final Color? normalBorderColor;
  final Color? fillColor;
  final double? focusBorder;
  final double? enabledBorder;
  final double? disabledBorder;
  final double? errorBorder;
  final double? normalBorder;

  const CustomTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.hint,
    this.textStyle,
    this.label,
    this.enabled,
    this.obscuringCharacter,
    this.value,
    this.onValidate,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffixWidget,
    this.icon,
    this.prefixIcon,
    this.action,
    this.focusNode,
    this.textDirection,
    this.edgeInsets = const EdgeInsets.only(
      top: 14,
      left: 16,
      right: 16,
      bottom: 14,
    ),
    // this.hintColor = Colors.white,
    this.focusBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.errorBorderColor,
    this.normalBorderColor,
    this.fillColor,
    this.focusBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.errorBorder,
    this.normalBorder,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textDirection: widget.textDirection,
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      initialValue: widget.value,
      validator: widget.onValidate,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      maxLines: widget.isPassword ?? false ? 1 : widget.maxLines,
      minLines: widget.isPassword ?? false ? 1 : widget.minLines,
      maxLength: widget.maxLength,
      obscureText: widget.isPassword ?? false ? obscureText : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.action ?? TextInputAction.done,
      focusNode: widget.focusNode,
      cursorColor: AppColors.black,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF777777),
          fontWeight: FontWeight.w500,
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 56),
        suffixIcon: widget.isPassword ?? false
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  // color: Colors.grey,
                ),
              )
            : widget.suffixWidget,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        counterText: "",
        fillColor: widget.fillColor ?? Colors.transparent,
        filled: true,
        contentPadding: widget.edgeInsets,

        errorStyle: const TextStyle(color: Color(0xFFCC0000), fontSize: 12),
        errorMaxLines: 6,
      ),
    );
  }
}
