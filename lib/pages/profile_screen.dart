

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riderapp/pages/log_in_page.dart';
import 'package:riderapp/utils/colors.dart';
import '../auth/auth_service.dart';
import '../customs/custom_snack_bar.dart';
import 'launcher_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scwidth= MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: const Color(0xFF565d91),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                Container(
                  height:562,
                  width: scwidth,
                  decoration: BoxDecoration(
                    color: themeColorBlue,
                  ),
                  child: ClipRRect(
                    child: Image.asset('images/fullback.jpg', height: 600,
                      width: scwidth, fit: BoxFit.cover,),
                  ),
                ),
                // Positioned(
                //   top: 1,
                //   child: Opacity(
                //     opacity: 0.3,
                //     child: Image.asset('images/profilebg.jpg',height: scheight/2,width: scwidth,)
                //   ),
                // ),

                Positioned(
                  top: scheight/13,
                    left: scwidth/2-60,
                    child: Column(
                      children: [
                        Container(
                          height:120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: themeColorBlue,
                            border: Border.all(color: themeColorBlue, width: 1),

                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: Image.asset('images/profilepic.jpg', height: 60,
                              width: 60, fit: BoxFit.cover,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Syed Hasbi',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    )
                ),
                Positioned(
                  top: scheight/3-10,
                    left: scwidth/2-(scwidth/2-20),
                    child: Container(
                      width: scwidth-40,
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,

                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Rider Information',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(child: Icon(Icons.person)),
                              Expanded(child: Text(" Syed Hasbi")),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Expanded(
                                  child: Icon(Icons.mail)
                              ),
                              Expanded(
                                child: Text(" Syed@gmail.com"),
                              ),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Expanded(
                                  child: Icon(Icons.phone)
                              ),
                              Expanded(
                                child: Text(" 01783080181"),
                              ),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Expanded(
                                  child: Icon(Icons.add_location)
                              ),
                              Expanded(
                                child: Text(" Court Bazar, Rajshahi"),
                              ),
                            ],
                          ),
                          SizedBox(height: 6
                            ,),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: scwidth-40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: themeColorBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: (){
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title:  Text('Are you sure ?'),
                      content: Text('Signing Out'),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('No',style: TextStyle(color: Colors.black))),
                        TextButton(onPressed: (){
                          EasyLoading.show(status: 'Please wait...');
                          logOut();
                          Navigator.pushReplacementNamed(context, LogInPage.routeName);
                        }, child: Text('Yes',style: TextStyle(color: Colors.black),)),

                      ],
                    );
                  },);
                },
                child: Text('Sign Out',style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      )
    );
  }
  void logOut() async {
    try {
      AuthService.logout().then((value) {
        //Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        // CustomSnackBar().showSnackBar(
        //     context: context,
        //     content: 'Log out Successful',
        //     backgroundColor: Colors.green);
      });
    } on FirebaseAuthException catch (e) {
    }
  }
}
