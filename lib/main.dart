import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(23.826741729120208, 90.38760308214225),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller){
          _mapController=controller;
          print("onMapCreated ########## $_mapController");
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,

        onCameraMove: (CameraPosition cameraPosition){
          print("onCameraMove ############# $cameraPosition");
        },
        onCameraIdle: (){
          print("fatching Data ############ ");
        },
        onTap: (LatLng latLing){
          print("onTap latLang##############$latLing");
        },



        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        mapToolbarEnabled: true,
        markers: <Marker>{
          Marker(
              markerId: MarkerId("one marker"),
              position: LatLng(23.826741729120208, 90.38760308214225),
              draggable: true,
              flat: true,
              infoWindow: InfoWindow(
                  title: "one office",
                  onTap: () {
                    print('###########this on the infoWindow');
                  }),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              onTap: () {
                print("##############this is onTap button");
              }),
          Marker(markerId: MarkerId("Second marker"),
          position: LatLng(23.82164354419727, 90.38834257418483),
            draggable: true,
            flat: true,
            infoWindow: InfoWindow(
              title: "second office",
              onTap: (){
                print("########### second office");
              }
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)
          )
        },

        circles: <Circle>{
          Circle(
            circleId: CircleId("one circle"),
            center: LatLng(23.82164354419, 90.388342574186),
            radius: 400,
            fillColor: Colors.red.shade100,
            strokeColor: Colors.red,
            strokeWidth: 4,
            visible: true,
            consumeTapEvents: false,
          )
        },
      ),
    );
  }
}

