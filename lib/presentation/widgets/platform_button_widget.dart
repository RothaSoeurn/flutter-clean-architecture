import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformButtonWidget {
  Widget build(VoidCallback onPressed, Widget child);

  factory PlatformButtonWidget(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidPlatformButton();
      case TargetPlatform.iOS:
        return IosPlatformButton();
      default:
        return AndroidPlatformButton();
    }
  }
}

class AndroidPlatformButton implements PlatformButtonWidget {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IosPlatformButton implements PlatformButtonWidget {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return CupertinoButton(onPressed: onPressed, child: child);
  }
}
