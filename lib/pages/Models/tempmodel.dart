/*const String storeaddress = 'storeaddress';
const String useraddress = 'useraddress';
const String picktime = 'picktime';
const String deltime = 'deltime';
const String approx='approx';*/


class TempModel{
  String? storeAddress;
  String? userAddress;
  String? pickUpTime;
  String? deliveryTime;
  String? distance;
  String? accept;

  TempModel(
      {
        this.storeAddress,
        this.userAddress,
        this.pickUpTime,
        this.deliveryTime,
        this.distance,
        this.accept,
      });
}