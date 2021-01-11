import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gitlist/main/factories/pages/home_page_factory.dart';
import 'package:gitlist/ui/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => makeHomePage()),
      ],
    );
  }
}
