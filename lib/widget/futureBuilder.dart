
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FutureProviderDemo extends StatelessWidget {
//   Future<String> fetchData() {
//     // Contoh Future yang mengambil data asinkron (dapat diganti dengan panggilan API, dll)
//     return Future.delayed(Duration(seconds: 2), () => "Data berhasil diambil!");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FutureProvider Example'),
//       ),
//       body: Center(
//         child: FutureProvider<String>(
//           create: (context) => fetchData(),
//           initialData: 'Memuat...',  
//           child: Consumer<String>(
//             builder: (context, data, _) {
//               return FutureBuilder<String>(
//                 future: Provider.of<String>(context).data,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else {
//                     return Text(snapshot.data ?? 'Tidak ada data');
//                   }
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }