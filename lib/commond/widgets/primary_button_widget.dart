import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.backgroundColor = Colors.blue,
      this.textColor = Colors.white,
      required this.text,
      required this.async,
      required this.function,
      this.suffix,
      this.perfix,
      this.border,
      this.textStyle,
      this.padding,
      this.boxShadow});
  final double? width;
  final double? height;
  final double? radius;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final String text;
  final Widget? suffix;
  final Widget? perfix;
  final EdgeInsets? padding;
  final bool async;
  final Function() function;

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.async
          ? () async {
              if (mounted) setState(() => inProgress = true);
              await widget.function();
              if (mounted) setState(() => inProgress = false);
            }
          : widget.function,
      child: Container(
        width: widget.width,
        height: (widget.height ?? 49),
        padding: widget.padding,
        decoration: BoxDecoration(
            border: widget.border,
            color: widget.backgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.radius ?? 12)),
            boxShadow: widget.boxShadow),
        alignment: Alignment.center,
        child: inProgress
            ? SizedBox(
                width: (widget.height ?? 49) - 20,
                height: (widget.height ?? 49) - 20,
                child: CircularProgressIndicator(color: widget.textColor),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.suffix != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: widget.suffix,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      widget.text,
                      style: widget.textStyle ??
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: widget.textColor,
                          ),
                    ),
                  ),
                  if (widget.perfix != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: widget.perfix,
                    ),
                ],
              ),
      ),
    );
  }
}
