import 'package:flutter/material.dart';

class TooltipWidget extends StatefulWidget {
  final Widget child;
  final String message;
  final EdgeInsetsGeometry padding;
  final Duration showDuration;
  final Decoration decoration;
  final TextStyle textStyle;
  final bool preferBelow;
  final double verticalOffset;

  const TooltipWidget({
    Key? key,
    required this.child,
    required this.message,
    this.padding = const EdgeInsets.all(16.0),
    this.showDuration = const Duration(seconds: 2),
    this.decoration = const BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    this.textStyle = const TextStyle(color: Colors.white),
    this.preferBelow = true,
    this.verticalOffset = 24.0,
  }) : super(key: key);

  @override
  _TooltipWidgetState createState() => _TooltipWidgetState();
}

class _TooltipWidgetState extends State<TooltipWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.showDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showTooltip() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          left: position.dx,
          top: position.dy - widget.verticalOffset,
          child: FadeTransition(
            opacity: _controller,
            child: Container(
              padding: widget.padding,
              decoration: widget.decoration,
              child: Text(
                widget.message,
                style: widget.textStyle,
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context)?.insert(_overlayEntry!);
    _controller.forward();
  }

  void _hideTooltip() {
    _controller.reverse().whenComplete(() {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showTooltip,
      onTapCancel: _hideTooltip,
      child: widget.child,
    );
  }
}
