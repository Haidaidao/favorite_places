import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  MapScreen({super.key, this.location = const PlaceLocation(latitude: 10.759465, longtitude: 106.675865, address: ''), this.isSelecting = true});
  PlaceLocation location ;
  bool isSelecting ;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your location' : 'Your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(_pickedLocation);
                },
                icon: Icon(Icons.save))
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelecting ? null:  (position) {
          setState(() {
            _pickedLocation = position;
          });
        },
        initialCameraPosition: CameraPosition(
            target:
                LatLng(widget.location.latitude, widget.location.longtitude),
            zoom: 16),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                    markerId: MarkerId('m1'),
                    position: _pickedLocation ??
                        LatLng(widget.location.latitude,
                            widget.location.longtitude))
              },
      ),
    );
  }
}
