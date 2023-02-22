import 'package:flutter/cupertino.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class DebounceButton extends StatelessWidget {
  const DebounceButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.pressedOpacity = 0.4,
    this.coolDown = 1000,
    this.color,
    this.disabledColor,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final double pressedOpacity;
  final int coolDown;
  final Color? color;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
      cooldown: Duration(milliseconds: coolDown),
      onTap: () async => onPressed(),
      builder: (context, onTap) => CupertinoButton(
        minSize: 0,
        onPressed: onTap,
        padding: EdgeInsets.zero,
        disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
        color: color,
        pressedOpacity: pressedOpacity,
        child: child,
      ),
    );
  }
}
