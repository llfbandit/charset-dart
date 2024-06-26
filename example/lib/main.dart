import 'dart:convert';

import 'package:charset/charset.dart';

void main(List<String> arguments) {
  // default
  print(utf16.decode([254, 255, 78, 10, 85, 132, 130, 229, 108, 52]));

  print(utf16.encode("上善若水"));

  // detect
  print(hasUtf16Bom([0xFE, 0xFF, 0x6C, 0x34]));

  // advance
  Utf16Encoder encoder = utf16.encoder as Utf16Encoder;
  print(encoder.encodeUtf16Be("上善若水", false));
  print(encoder.encodeUtf16Le("上善若水", true));

  // detect encoding

  String text = "上善若水";

  List<int> shiftJisData = shiftJis.encode(text);
  print(Charset.detect(
    shiftJisData,
    orders: [ascii, shiftJis, latin1],
  )?.name);

  text = 'ABC55/';
  List<int> asciiData = ascii.encode(text);
  print(Charset.detect(asciiData)?.name);
}
