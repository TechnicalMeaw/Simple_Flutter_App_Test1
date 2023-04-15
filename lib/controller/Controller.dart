import 'dart:convert';
import 'package:get/get.dart';
import '../models/Album.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController{
  RxInt _count = 0.obs;

  int  get count => _count.value;

  increment() {
    return _count++;
  }


  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}