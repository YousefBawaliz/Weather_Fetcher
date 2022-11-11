import 'package:http/http.dart' as http;
import 'dart:convert';

//this class can be instantiated to get an Api call and then decode it's data and return it
class NetworkHelper {
  String locationUrl;

  NetworkHelper(this.locationUrl);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(locationUrl));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
    // print(response.body);
    // print(response.statusCode);

    // var weather = jsonDecode(response.body)['weather'][0]['main'];
    // var temp = jsonDecode(response.body)['main']['pressure'];
  }
}
