// import 'package:flutter/material.dart';
// import 'package:tai/commonWidgets/arrowButton.dart';
// import 'package:tai/features/deposit/presentation/depositDetails.dart';

// class DepositLocations extends StatefulWidget {
//   const DepositLocations({super.key});

//   @override
//   State<DepositLocations> createState() => _DepositocationsState();
// }

// class _DepositocationsState extends State<DepositLocations> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Deposit",
//           style: TextStyle(fontSize: 20),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             color: Colors.black,
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back)),
//       ),
//       body: SafeArea(
//           child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               const Text(
//                 "Select deposit method",
//                 style: TextStyle(fontSize: 20),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               Column(
//                 children: [
                  
//                   ArrowButton(
//                       label: "Mobile Money Wallet",
//                       image: "mmWallet.svg",
//                       innerContainerColor: const Color(0xFFC4F1CD),
//                       onTap: () {
//                         Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const DepositDetails ()));
//                       }),
//                       const SizedBox(
//                     height: 30,
//                   ),
                      
//                 ],
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }