import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class FoetusVitals {
  getFoetusVitals() async {
    var url = Uri.parse('https://thingspeak.com/channels/1707901/feed.json');
    var response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    int len = json["feeds"].length;
    List<double> foetusVitals = [];
    int i;
    for (i = 0; i < len; i++) {
      String vitals = json["feeds"][i]["field1"];
      double vital = double.parse(vitals);
      if (vital < 90 && !vitals.contains("0")) {
        foetusVitals.add(vital * 2);
      } else if (vital > 200 && !vitals.contains("0")) {
        foetusVitals.add(vital / 3);
      }
      // } else if (!vitals.contains("0")) {
      //   double test = double.parse(vitals);
      //   foetusVitals.add(test);
      // }
    }
    return foetusVitals;
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
