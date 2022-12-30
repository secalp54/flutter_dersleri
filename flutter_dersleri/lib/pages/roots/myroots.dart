// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dersleri/pages/anasayfa.dart';


// class MyRoots {
//   static Route<dynamic>? roots(RouteSettings settings) {
//     if (Pages.home.path == settings.name) {
//       return Pages.home.DEVICES(defaultTargetPlatform);
//     }
//      if (Pages.pageOne.path == settings.name) {
//       return MaterialPageRoute(builder: ((context) => PageOne()));
//     }
//      if (Pages.pageTwo.path == settings.name) {
//       return Pages.pageTwo.DEVICES(defaultTargetPlatform);
//     }
//   }
// }

// enum Pages { home, pageOne, pageTwo }

// extension PagesExtension on Pages {
//   String get path {
//     switch (this) {
//       case Pages.home:
//         return "/";
//       case Pages.pageOne:
//         return "/pageOne";
//       case Pages.pageTwo:
//         return "/pageTwo";
//     }
//   }

//   Route<dynamic>? DEVICES(TargetPlatform targetPlatform) {
//     switch (this) {
//       case Pages.home:
//         return targetPlatformRoutes(AnaSayfa());
//       case Pages.pageOne:
//         return targetPlatformRoutes(PageOne());
//       case Pages.pageTwo:
//         return targetPlatformRoutes(PageTwo());
//         break;
//     }
//   }
// }

// PageRoute targetPlatformRoutes(Widget T) {
//   if (defaultTargetPlatform == TargetPlatform.iOS) {
//     return CupertinoPageRoute(builder: ((context) => T));
//   } else {
//     return MaterialPageRoute(builder: (context) => T);
//   }
// }
