import 'package:flutter/material.dart';

bool isDarkMode = true;

class ColorHelper {
  static Color splashBackgroundColor =
      isDarkMode ? Color(0xff191919) : Color(0xff74B55D);
  static Color splashIconColor =
      isDarkMode ? Color(0xff90E072) : Color(0xffFFFFFF);
  static Color backgroundColor =
      isDarkMode ? Color(0xff191919) : Color(0xffEFEFEF);
  static Color textColor = isDarkMode ? Color(0xffE1E1E1) : Color(0xff101010);
  static Color blue01DDEB = Color(0xff01DDEB);
  static Color green90E072 = Color(0xff90E072);
  static Color greyD1D3D3 = Color(0xffD1D3D3);
  static Color black000000 = Color(0xff000000);
  static Color whiteECECEC = Color(0xffECECEC);
  static Color white10 = Colors.white10;
  static Color blackwithopacity01 = Colors.black.withOpacity(0.1);
  static Color black38 = Colors.black38;
  static Color black101010 = Color(0xff101010);
  static Color grey878787 = Color(0xff878787);
  static Color whiteFFFFFFWithopacity05 =
      const Color(0xffFFFFFF).withOpacity(0.5);
}
