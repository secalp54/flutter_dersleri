import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String url =
        "https://pixabay.com/get/g8b8f2c6739ed50ab423c4d2bc5838803c7802598383c364a55d10dddb618fa4e1fd72f23b1c1e932f7c277d43a6f10308c1982898b789a6989fbb014718fe06b9b37842d763e4231c1c6ed830450de3f_640.jpg";
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(child: Text("Alp")),
        ));
  }
}



// class customCenter extends StatelessWidget {
//   final String url;
//    customCenter({required this.url}) 


//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.amber[100],
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image(height: 200, image: NetworkImage(url)),
//             Container(
//               color: Colors.blue[200],
//               width: 75,
//               height: 75,
//             ),
//             Container(
//               color: Colors.green[200],
//               width: 75,
//               height: 75,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
