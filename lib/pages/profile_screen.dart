import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riderapp/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scheight= MediaQuery.of(context).size.height;
    double scwidth= MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: const Color(0xFF565d91),
        ),
        body: Center(
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
                  Positioned(
                    top: 1,
                    child: Opacity(
                        opacity: 0.3,
                        child: Image.asset('images/profilebg.PNG')
                    ),
                  ),
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
                            SizedBox(height: 10,),
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
                            SizedBox(height: 10,),
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
                            SizedBox(height: 10,),
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
                            SizedBox(height: 10,)

                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        )
    );
  }
}
