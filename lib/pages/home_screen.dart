import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riderapp/pages/Provider/orderproviderpage.dart';
import 'package:riderapp/pages/google_map.dart';
import 'package:riderapp/utils/colors.dart';
import 'Models/tempmodel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='/homepage';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
String? initaplink;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TextEditingController dateController = TextEditingController();
  bool _switchValue = true;
  late TabController _tabController;
  List<TempModel> articles= [];
  List<TempModel> favoriteDataList = [];
  bool loading=true;
  bool accepted = true;
  String? date;

  @override
  void initState() {
    dateController.text = '';
    getNews();
    date = DateFormat('dd MMM yyyy').format(DateTime.now());
    super.initState();
  }
  getNews()async{
    TechNews news= TechNews();
    await news.getnews();
    articles=news.techNews;
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: backgroundwhite,
      appBar: AppBar(
        backgroundColor: const Color(0xFF565d91),
        title: const Text('Delivery',
          style: TextStyle(fontSize: 20),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),

      body: loading? const Center(
        child: CircularProgressIndicator(),
      ):
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Column(children: const [Icon(Icons.date_range,color: themeColorBlue,)],),
                const SizedBox(width: 10,),
                Column(children: [Text('${date}',style: TextStyle(color: themeColorBlue,fontWeight: FontWeight.bold),),],),
                const SizedBox(width: 50,),
                Column(children: const [Text('Are you available ?',
                  style: TextStyle(color: Color(0xFF565d91)),)],),
                Column(children: [
                  Switch(
                      activeColor: const Color(0xFFed842a),
                      value: _switchValue,
                      onChanged: (value){
                        setState(() {
                          _switchValue = value;
                        });
                      })
                  ],
                )
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.black,
            labelPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
            tabs: const [
              Tab(
                child: Text('New Order',style: TextStyle(color: Colors.black),),
              ),
              Tab(
                child: Text('Active Order',style: TextStyle(color: Colors.black)),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height-260,
            child: Expanded(child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      itemCount: articles.length,
                      itemBuilder:(context, index){
                        return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 0.5,
                                              ),
                                            )
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Store Address'),
                                              Row(
                                                children: [
                                                  Icon(Icons.location_pin),
                                                  Expanded(child: Text('${articles[index].storeAddress}',style: TextStyle(fontSize: 20),))
                                                ],
                                              ),
                                              SizedBox(height: 10,),
                                              Text('User Address'),
                                              Row(
                                                children: [
                                                  Icon(Icons.location_pin),
                                                  Expanded(child: Text(('${articles[index].userAddress}'),style: TextStyle(fontSize: 20),))

                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.black,
                                                width: 0.5,
                                              ),
                                            )
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Order Pickup Time'),
                                                Row(
                                                  children: [
                                                    Icon(Icons.access_time),
                                                    Text('${articles[index].pickUpTime}',style: TextStyle(fontSize:20,color: Colors.black))
                                                  ],
                                                )
                                              ],
                                            )),
                                            Expanded(child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Delivery Time'),
                                                Row(
                                                  children: [
                                                    Icon(Icons.access_time),
                                                    Text('${articles[index].deliveryTime}',style: TextStyle(fontSize:20,color: Colors.black))
                                                  ],
                                                )
                                              ],
                                            ))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15,),
                                      SingleChildScrollView(

                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Approx: '),
                                            Text('${articles[index].distance}',style: TextStyle(fontWeight: FontWeight.bold),),
                                            SizedBox(width: 50,),




                                            articles[index].accept=='true'?
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: acceptbutcol,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8), // <-- Radius
                                                ),
                                              ),


                                              onPressed: (){
                                                setState(() {
                                                  favoriteDataList.add(articles[index]);
                                                  articles[index].accept = 'false';
                                                });
                                              },


                                              child: Text('ACCEPT',style: TextStyle(fontSize: 17),),
                                            ):
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: acceptbutcol,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8), // <-- Radius
                                                ),
                                              ),
                                              onPressed: null,
                                              child: Text('ACCEPTED',style: TextStyle(fontSize: 17),),
                                            ),
                                            SizedBox(width: 10,),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],
                          );
                      }
                  ),



                  ListView.builder(
                      itemCount: favoriteDataList.length,
                      itemBuilder:(context, index){
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            ),
                                          )
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Store Address'),
                                            Row(
                                              children: [
                                                Icon(Icons.location_pin),
                                                Expanded(child: Text('${articles[index].storeAddress}',style: TextStyle(fontSize: 20),))
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Text('User Address'),
                                            Row(
                                              children: [
                                                Icon(Icons.location_pin),
                                                Expanded(child: Text('Adarsh Super Market, Bakti Bazar Road, Adarsh, Surat',style: TextStyle(fontSize: 20),))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0.0,20.0,0.0,20.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.5,
                                            ),
                                          )
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Order Pickup Time'),
                                              Row(
                                                children: [
                                                  Icon(Icons.access_time),
                                                  Text('8:00 AM',style: TextStyle(fontSize:20,color: Colors.black))
                                                ],
                                              )
                                            ],
                                          )),
                                          Expanded(child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Delivery Time'),
                                              Row(
                                                children: [
                                                  Icon(Icons.access_time),
                                                  Text('4:00 PM',style: TextStyle(fontSize:20,color: Colors.black))
                                                ],
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Text('Approx: '),
                                        const Text('5 KM',style: TextStyle(fontWeight: FontWeight.bold),),
                                        const SizedBox(width: 40,),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: firstbuttoncolor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8), // <-- Radius
                                            ),
                                          ),
                                          onPressed: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const GoogleMap()),
                                            );
                                          },
                                          child: const Text('Go To Map',style: TextStyle(fontSize: 17),),
                                        ),
                                        const SizedBox(width: 10,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        );
                      }
                  ),
                ],
              ),
            )),
          )
        ],

      )
    );
  }
}
