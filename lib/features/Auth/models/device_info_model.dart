// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class DeviceInfo {
String? deviceType;
String? deviceId;
String? deviceName;
String? deviceOSVersion;
String? deviceIPAddress;
String? lat;
String? long;
String? buyer_gcmid;
String? buyer_pemid;
List<Map<String,String>>? app;

  DeviceInfo({
    this.deviceType,
    this.deviceId,
    this.deviceName,
    this.deviceOSVersion,
    this.deviceIPAddress,
    this.lat,
    this.long,
    this.buyer_gcmid,
    this.buyer_pemid,
    this.app
  });

  Map toJson()=>{
    "deviceType": deviceType,
    "deviceId": deviceId,
    "deviceName": deviceName,
    "deviceOSVersion": deviceOSVersion,
    "deviceIPAddress": deviceIPAddress,
    "lat": lat,
    "long": long,
    "buyer_gcmid": "",
    "buyer_pemid": "",
    "app": {
        "version": "1.20.5",
        "installTimeStamp": "2022-02-10T12:33:30.696Z",
        "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
        "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
    }
  };

  @override
  String toString() {
    return 'DeviceInfo(deviceType: $deviceType, deviceId: $deviceId, deviceName: $deviceName, deviceOSVersion: $deviceOSVersion, deviceIPAddress: $deviceIPAddress, lat: $lat, long: $long, buyer_gcmid: $buyer_gcmid, buyer_pemid: $buyer_pemid, app: $app)';
  }
}




//sample data
// {
//     "deviceType": "andriod",
//     "deviceId": "C6179909526098",
//     "deviceName": "Samsung-MT200",
//     "deviceOSVersion": "2.3.6",
//     "deviceIPAddress": "11.433.445.66",
//     "lat": 9.9312,
//     "long": 76.2673,
//     "buyer_gcmid": "",
//     "buyer_pemid": "",
//     "app": {
//         "version": "1.20.5",
//         "installTimeStamp": "2022-02-10T12:33:30.696Z",
//         "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
//         "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
//     }
// }