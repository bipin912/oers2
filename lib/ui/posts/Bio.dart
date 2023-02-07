// import 'dart:developer';
// import 'dart:ffi';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:oers/widgets/round_button.dart';
//
// import '../../utils/utils.dart';
//
// class bio extends StatefulWidget {
//   const bio({Key? key}) : super(key: key);
//
//   @override
//   State<bio> createState() => _bioState();
// }
//
// class _bioState extends State<bio> {
//
//   final usernameController = TextEditingController();
//   final agecontroller=TextEditingController();
//   final gamecontroller=TextEditingController();
//   final rankcontroller=TextEditingController();
//   final levelcontroller=TextEditingController();
//
//
//
//   bool loading = false;
//
//   final databaseRef = FirebaseDatabase.instance.ref('bio');
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   // void inputData() {
//   //   final User? user = auth.currentUser;
//   //   final uid = user?.uid;
//   //   // here you write the codes to input the data into firestore
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text('Add Bio'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               controller: usernameController,
//               decoration: InputDecoration(
//                   hintText: 'Username', border: OutlineInputBorder()),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               controller: agecontroller,
//               decoration: InputDecoration(
//                   hintText: 'Age', border: OutlineInputBorder()),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               controller: gamecontroller,
//               decoration: InputDecoration(
//                   hintText: 'Game', border: OutlineInputBorder()),
//             ),SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               controller: rankcontroller,
//               decoration: InputDecoration(
//                   hintText: 'Rank', border: OutlineInputBorder()),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               controller: levelcontroller,
//               decoration: InputDecoration(
//                   hintText: 'level', border: OutlineInputBorder()),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             RoundButton(
//                 title: 'Update',
//                 loading: loading,
//                 onTap: () {
//                   Navigator.pop(context);
//                   setState(() {
//                     loading=true;
//                   });
//
//                   var uid = auth.currentUser!.uid;
//
//                   //DateTime.now().millisecondsSinceEpoch.toString();
//                 databaseRef.child(uid).set({
//
//               'Username': usernameController.text.toString(),
//                   'Age': agecontroller.text.toString(),
//                   'Game':gamecontroller.text.toString(),
//                   'Rank':rankcontroller.text.toString(),
//                   'level':levelcontroller.text.toString(),
//
//             }).then((value){
//                   Utils().toastMessage('Bio Updated');
//                   setState(() {
//                     loading=false;
//                   });
//
//                 }).onError((error, stackTrace){
//                   Utils().toastMessage(error.toString());
//                   setState(() {
//                     loading=false;
//                   });
//                 });
//             })
//           ],
//         ),
//       ),
//     );
//     // Future<void> showUserNameDialogAlert(BuildContext){
//     //   return showDialog(context: context,
//     //       builder:(context){
//     //     return AlertDialog();
//     //
//     //       });
//     //
//     // }
//   }
//
// }
