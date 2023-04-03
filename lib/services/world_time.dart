import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;
  WorldTime({required this.location, required this.flag, required this.url});
  Future<void> getTime() async {
    try {
      var urlParsed = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(urlParsed);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String offsetSubString = offset.substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetSubString)));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      time = "could not get time data";
    }
  }
}
