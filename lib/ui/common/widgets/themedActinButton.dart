import 'package:flutter/material.dart';

import '../styles.dart';
class ThemedActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? buttonLabel;
  final Widget? child;
  final Color? textColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool isDisabled;

  const ThemedActionButton(
      {required this.onTap,
        this.buttonLabel,
        this.child,
        this.textColor,
        this.fillColor,
        this.borderColor,
        this.textStyle,
        this.width,
        this.height,
        this.padding,
        this.isDisabled = false,
        Key? key})
      : assert(onTap != null),
        assert(buttonLabel != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: isDisabled ? () => {} : onTap,
    child: RoundedContainer(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      backgroundColor: isDisabled ? Colors.grey : fillColor,
      borderColor: isDisabled ? Colors.grey : borderColor,
      width: width ?? double.maxFinite,
      height: height,
      child: Center(
        child: Text(
          buttonLabel!,
          style: textStyle ??
              buttonTextStyle.copyWith(
                  color: textColor ?? Colors.white),
        ),
      ),
    ),
  );
}


class RoundedContainer extends Container {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  RoundedContainer(
      {required this.child,
        this.height,
        this.width,
        this.backgroundColor,
        this.borderColor,
        this.padding,
        this.border,
        this.boxShadow,
        Key? key})
      : assert(child != null),
        super(
        key: key,
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? Color.fromARGB(100, 20, 38, 203),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: boxShadow,
          border: border ??
              Border.all(
                width: 1,
                color: borderColor ?? Color.fromARGB(100, 20, 38, 203),
              ),
        ),
      );
}