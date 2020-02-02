import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const blue_dark = const Color(0xFF344cb0);     // PrimaryColorDark
const blue = const Color(0xFF4169e1);          // PrimaryColor
const blue_light = const Color(0xD96598EA);    // PrimaryColorLight
const radium_dark = const Color(0xFF136f5b);
const radium = const Color(0xFF26e8bd);        // AccentColor
const radium_light = const Color(0x2326e8bd);
const yellow = const Color(0xFFf7ca40);

const white = Colors.white;
const grey_light = const Color(0xFFe1e6e8);
const grey = const Color(0xFF898c8c);
const charcoal_light = const Color(0xFF4a4a4a);
const charcoal = const Color(0xFF292929);
const charcoal_dark = const Color(0xFF1A1A1A);
const black = Colors.black;
const semi_transparent = Colors.black87;
const transparent = const Color(0x00ffffff);
const box_shadow = const Color(0x0d000000);

const g_pink_yellow = const LinearGradient(
    colors: [blue, radium],
    begin: const FractionalOffset(0.4, 0.0),
    end: const FractionalOffset(0.0, 0.5),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
);
