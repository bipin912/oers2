import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'package:oers/ui/auth/login_screen.dart';
import 'package:oers/ui/firestore/add_firestore_data.dart';

import 'package:oers/utils/utils.dart';


import '../posts/Tournament.dart';
class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
   final auth = FirebaseAuth.instance;
  // Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getData() async {
  //   User user = auth.currentUser!;
  //     return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.uid)
  //       .snapshots();
  // }


  //final fireStore = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  //CollectionReference ref = FirebaseFirestore.instance.collection('users');
  //
  // final editUsernameController= TextEditingController();
  // final editAgeController= TextEditingController();
  // final editGameController= TextEditingController();
  // final editRankController= TextEditingController();
  // final editLevelController= TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome to OERS'),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: Icon(Icons.logout)),
          SizedBox(width: 10)
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height:10),
          StreamBuilder(

            stream: FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).snapshots(),
              builder: ( context,  snapshot){
               if (snapshot.connectionState == ConnectionState.waiting)
                 return CircularProgressIndicator();
               if(snapshot.hasError)
                  return Text ("Hello new Friend Welcome to OERS. Please fill up your bio using '+' button");

              return         Expanded(
                child: ListView.builder(


                    itemCount:1,
                    itemBuilder: (context,index){


                  return Column(
                    children: [
                      ListTile(
                        onTap: (){
                          // ref.doc(snapshot.data!.docs[index]['id'].toString().update({
                          //  'Username': 'Bipin'
                          // }).then((value){
                          //   Utils().toastMessage('updated');
                          // }).onError((error,stackTrace){
                          //   Utils().toastMessage(error.toString());
                          // }));
                        },

                        title: Text(snapshot.data!['Username']),
                        subtitle: Text('Username'),
                      ),
                      ListTile(
                        title: Text(snapshot.data!['Age']),
                        subtitle: Text('Age'),
                      ),
                      ListTile(
                        title: Text(snapshot.data!['Game']),
                        subtitle: Text('Game'),
                      ),
                      ListTile(
                        title: Text(snapshot.data!['Rank']),
                        subtitle: Text('Rank'),
                      ),
                      ListTile(
                        title: Text(snapshot.data!['level']),
                        subtitle: Text('Level'),
                      )
                    ],
                  );

                }
                ),
              );
              }),



          

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Tournament() ));
          }, child: Text("Join Valorant Tournament"),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddFirestoreDataScreen()));
        },
        child: Icon(Icons.add),
      ),

    );


  }
  // Future<void> showMyDialog(String Username, String Age,
  //     String Game, String Rank, String level) async{
  //   editUsernameController.text=Username;
  //   editAgeController.text=Age;
  //   editGameController.text=Game;
  //   editRankController.text=Rank;
  //   editLevelController.text=level;
  //   return showDialog(
  //       context:context,
  //       builder: (BuildContext context){
  //         return AlertDialog(
  //           title : Text('update'),
  //           content: Container(
  //             child: TextField(
  //                 controller: editUsernameController,
  //
  //
  //
  //                 decoration: InputDecoration(
  //                     hintText: 'Edit'
  //                 )
  //             ),
  //           ),
  //           actions: [
  //             TextButton(onPressed: (){
  //               Navigator.pop(context);
  //             }, child:
  //             Text('cancel')),
  //             TextButton(onPressed: (){
  //               Navigator.pop(context);
  //
  //             }, child:
  //             Text('Update'))
  //           ],
  //         );
  //       }
  //   );
  // }
}


