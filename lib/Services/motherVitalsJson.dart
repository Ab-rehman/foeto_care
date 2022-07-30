import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class MothersVitals {
  getMothersVitals() async {
    var url = Uri.parse('https://thingspeak.com/channels/1707901/feed.json');
    var response = await http.get(url);
    Map<String,dynamic> json = jsonDecode(response.body);
    int len = json["feeds"].length;
    List<double> motherVitals = [];
    int i;
    for(i=0;i<len;i++) {
      String verse = json["feeds"][i]["field1"];
      if(!verse.contains("0")) {
        double test = double.parse(verse);
        motherVitals.add(test);
      }
    }
    return motherVitals;
  }
}


