import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simple_app/controller/Controller.dart';

import 'models/Album.dart';

class NetworkFetchScreen extends StatefulWidget {
  const NetworkFetchScreen({Key? key}) : super(key: key);

  @override
  State<NetworkFetchScreen> createState() => _NetworkFetchScreenState();
}

class _NetworkFetchScreenState extends State<NetworkFetchScreen> {
  late Future<Album> futureAlbum;

  final controller = Get.put(Controller());

  @override
  void initState() {
    futureAlbum = controller.fetchAlbum();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              nativeProgress(Theme.of(context).platform);
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget nativeProgress(TargetPlatform targetPlatform) {
    switch (targetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const CircularProgressIndicator();

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const CupertinoActivityIndicator();

      default: return const Offstage();
    }
  }
}
