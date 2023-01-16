import 'dart:convert';
import '../Models/tempmodel.dart';
import 'package:http/http.dart' as http;


class TechNews{
  List <TempModel> techNews=[];
  Future<void> getnews() async{
    http.Response response;
    String apilink="https://mocki.io/v1/2c855c5e-5f3f-42c4-aa1a-810f1ed5f741";
    response=await http.get(Uri.parse(apilink));
    var jsondata= jsonDecode(response.body);
    if(jsondata['status']=='ok')
    {
      jsondata['articles'].forEach((element){
          TempModel articleModel=TempModel(
              storeAddress: element['shopadress'],
              userAddress: element['useradress'],
              pickUpTime: element['pickuptime'],
              deliveryTime: element['deliverytime'],
              distance: element['distance'],
              accept: element['bool'],
          );
          techNews.add(articleModel);

      });
    }
  }
}