import 'package:flutter/material.dart';

class MyModel{
  String image_url;
  String location;
  String name;

  MyModel(this.image_url, this.name, this.location);

  String get getImageUrl{
    return image_url;
  }
  String get getName{
    return name;
  }
  String get getLocation{
    return location;
  }
}