// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
//
// import 'package:flutter/material.dart';
// import 'package:oers/ui/auth/login_screen.dart';
// //import 'package:oers/ui/posts/Tournament.dart';
// import 'package:oers/utils/utils.dart';
// import 'package:oers/ui/posts/Bio.dart';
//
// import 'Tournament.dart';
//
// class PostScreen extends StatefulWidget {
//   const PostScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }
//
// class _PostScreenState extends State<PostScreen> {
//   final auth = FirebaseAuth.instance;
//   final ref = FirebaseDatabase.instance.ref('bio');
//   final editUsernameController= TextEditingController();
//   final editAgeController= TextEditingController();
//   final editGameController= TextEditingController();
//   final editRankController= TextEditingController();
//   final editLevelController= TextEditingController();
//
//
// @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   ref.onValue.listen((event) { });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Welcome to OERS'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 auth.signOut().then((value) {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => loginScreen()));
//                 }).onError((error, stackTrace) {
//                   Utils().toastMessage(error.toString());
//                 });
//               },
//               icon: Icon(Icons.logout)),
//           SizedBox(width: 10)
//         ],
//       ),
//       body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//
//
//
//           // showMyDialog(bio,snapshot.child('bio').value.toString());
//          // FutureBuilder<String>(
//           //   future: () async {
//           //     //FirebaseAuth auth = FirebaseAuth.instance;
//           //     var user = FirebaseAuth.instance.currentUser;
//           //     String uid = user!.uid.toString();
//           //     return uid;
//           //   }(),
//           //   builder: (context, snapshot) {
//           //     if (snapshot.hasData) {
//           //       return Text(snapshot.data);           // <- Customize your widget here
//           //     } else {
//           //       return CircularProgressIndicator();
//           //     }
//           //   },
//           // )
//
//
//           // Expanded(
//           //     child: StreamBuilder(
//           //         stream: ref.onValue,
//           //         builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//           //           if (!snapshot.hasData) {
//           //             return CircularProgressIndicator();
//           //           } else {
//           //             Map<dynamic,dynamic> map = (snapshot.data?.snapshot.value??{}) as dynamic;
//           //             List<dynamic> list=[];
//           //             list.clear();
//           //             list= map.values.toList();
//           //             return ListView.builder(
//           //                 itemCount: snapshot.data!.snapshot.children.length,
//           //                 itemBuilder: (context, int index) {
//           //                   return ListTile(
//           //                     title: Column(
//           //                       children: [
//           //                         Text(list[index]['email']),
//           //                       ],
//           //                     ),
//           //                  );
//           //                 });
//           //           }
//           //         })),
//           Expanded(
//            child: FirebaseAnimatedList(
//                 query: ref.child(auth.currentUser!.uid).orderByChild('Username'),
//                 defaultChild: Text('Loading'),
//                 itemBuilder: (context, snapshot, animation, index) {
//
//                   final Username = snapshot.child('Username').value.toString();
//                   final Age = snapshot.child('Age').value.toString();
//                   final Game = snapshot.child('Game').value.toString();
//                   final Rank = snapshot.child('Rank').value.toString();
//                   final level = snapshot.child('level').value.toString();
//
//                   //final id = snapshot.child('id').value.toString();
//                   return ListTile(
//                     title: Column(
//                       children: [
//                         Text(snapshot.child('Username').value.toString(),),
//                         Text(snapshot.child('Age').value.toString(),),
//                         Text(snapshot.child('Game').value.toString(),),
//                         Text(snapshot.child('Rank').value.toString(),),
//                         Text(snapshot.child('level').value.toString(),),
//                       ],
//                     ),
//
//                     //subtitle: Text(snapshot.child('id').value.toString()),
//                     trailing: PopupMenuButton(
//     icon: Icon(Icons.more_vert),
//     itemBuilder: (context)=>[
//       PopupMenuItem(
//     value:1,
//     child:ListTile(
//     onTap: (){
//       Navigator.pop(context);
//       showMyDialog(Username,Age,Game,Rank,level);
//     },
//     leading : Icon(Icons.edit),
//     title: Text('Edit')
//     )
//     ),
//       // PopupMenuItem(
//       //     value:2,
//       //     child:ListTile(
//       //         onTap: (){
//       //           ref.child(auth.currentUser!.uid).remove();
//       //           //Navigator.pop(context);
//       //           //showMyDialog(Username);
//       //         },
//       //         leading : Icon(Icons.delete_outline),
//       //         title: Text('Delete'),
//       //     )
//       // )
//     ]
//     ),
//
//                 );
//                 }),
//           ),
//           ElevatedButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>Tournament() ));
//           }, child: Text("Join Valorant Tournament"),),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => bio()));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//
//   }
//   Future<void> showMyDialog(String Username, String Age,
//       String Game, String Rank, String level) async{
//   editUsernameController.text=Username;
//   editAgeController.text=Age;
//   editGameController.text=Game;
//   editRankController.text=Rank;
//   editLevelController.text=level;
//     return showDialog(
//         context:context,
//         builder: (BuildContext context){
//           return AlertDialog(
//             title : Text('update'),
//             content: Container(
//               child: TextField(
//                 controller: editUsernameController,
//
//
//
//                 decoration: InputDecoration(
//                   hintText: 'Edit'
//                 )
//               ),
//             ),
//             actions: [
//               TextButton(onPressed: (){
//                 Navigator.pop(context);
//               }, child:
//               Text('cancel')),
//               TextButton(onPressed: (){
//                 Navigator.pop(context);
//                 ref.child(auth.currentUser!.uid).update({
//                 'Username':editUsernameController.text.toString(),
//                   'Age':editAgeController.text.toString(),
//                   'Game':editGameController.text.toString(),
//                   'Rank':editRankController.text.toString(),
//                   'level': editLevelController.text.toString(),
//                 }).then((value){
//                   Utils().toastMessage('Post updated');
//
//                 })
//
//                 .onError((error, stackTrace) {
//                   Utils().toastMessage(error.toString());
//                 });
//               }, child:
//               Text('Update'))
//             ],
//           );
//         }
//     );
//   }
// }
