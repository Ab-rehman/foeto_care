import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class MothersVitals {
  getMothersVitals() async {
    var url = Uri.parse('https://thingspeak.com/channels/1707901/feed.json');
    var response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    int len = json["feeds"].length;
    List<double> motherVitals = [];
    int i;
    for (i = 0; i < len; i++) {
      String vitals = json["feeds"][i]["field1"];
      if (!vitals.contains("0")) {
        double test = double.parse(vitals);
        motherVitals.add(test);
      }
    }
    return motherVitals;
  }

  getTimeStamp() async {
    var url = Uri.parse('https://thingspeak.com/channels/1707901/feed.json');
    var response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    int len = json["feeds"].length;
    List<String> timeStamp = [];
    int i;
    for (i = 0; i < len; i++) {
      String dateTime = json["feeds"][i]["created_at"];
      String time = dateTime.substring(0, 10);

      timeStamp.add(time);
    }
    return timeStamp;
  }
}
