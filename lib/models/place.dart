import 'dart:io';

import 'package:uuid/uuid.dart';

final uui = Uuid();

class PlaceLocation {
  const PlaceLocation(
      {required this.latitude,
      required this.longtitude,
      required this.address});

  final double latitude;
  final double longtitude;
  final String address;
}

class Place {
  Place({required this.title, required this.image, required this.location, String? id}) : id = id ?? uui.v4();
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
