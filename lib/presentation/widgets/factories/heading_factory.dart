import 'package:flutter/material.dart';

abstract class TextPrototypeFactory {
  Widget build(String text);
}

class HeaderH1 implements TextPrototypeFactory {
  @override
  Widget build(String text) {
    return Text(text);
  }
}
