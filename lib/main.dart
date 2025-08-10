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
        initialCameraPosition: const CameraPosition(
          target: const LatLng(23.826741729120208, 90.38760308214225),
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
         // print("fatching Data ############ ");
        },
        onTap: (LatLng latLing){
          print("onTap latLang##############$latLing");  //vvi you will be find very easily ,,,but fist you give one LatLog by google map
          //LatLng (short for Latitude & Longitude) is simply a pair of coordinates used to pinpoint a location on Earth.
        },



        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        mapToolbarEnabled: true,
        markers: <Marker>{
          Marker(
              markerId: const MarkerId("one marker"),
              position: const LatLng(23.826741729120208, 90.38760308214225),
              draggable: true,  //marker can move
              flat: true,      //
              infoWindow: InfoWindow(
                  title: "River",
                  onTap: () {
                    print('###########this on the infoWindow');
                  }),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              onTap: () {
                print("##############this is onTap button");
              }),
          Marker(markerId: const MarkerId("Second marker"),
          position: const LatLng(23.82164354419727, 90.38834257418483),
            draggable: true,
            flat: true,
            infoWindow: InfoWindow(
              title: "Covid 19 Risk zone",
              onTap: (){
                print("########### second office");
              }
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)
          )
        },

        circles: <Circle>{
          Circle(
            circleId: const CircleId("one circle"),
            center: const LatLng(23.82164354419, 90.388342574186),
            radius: 400,
            fillColor: Colors.red.shade100,
            strokeColor: Colors.red,
            strokeWidth: 4,
            visible: true,
            consumeTapEvents: true,//in circle touch will be not work
          ),
          Circle(
            circleId: const CircleId("one circle"),
            center: const LatLng(23.835714458173435, 90.38845293223858),
            radius: 200,
            fillColor: Colors.red.shade100,
            strokeColor: Colors.red,
            strokeWidth: 4,
            visible: true,
            consumeTapEvents: true,//in circle touch will be not work
          ),
        },

        polylines: <Polyline>{
          const Polyline(polylineId: PolylineId("one poline"),
            points: [
              LatLng(23.81800709505855, 90.38376074284315),
              LatLng(23.815659120002728, 90.3848235681653),
              LatLng(23.817364205000583, 90.38810960948467),
              LatLng(23.818814997228813, 90.38624580949545),
              LatLng(23.818575448932123, 90.38474176079035)
            ],
            color: Colors.green,
            jointType: JointType.round,
            width: 6,
          ),
        },


        polygons: <Polygon>{
          const Polygon(polygonId: PolygonId("One polygone"),
            points: [
              LatLng(23.823109921940347, 90.3873036056757),
              LatLng(23.82367825346711, 90.38592226803303),
              LatLng(23.825330786689655, 90.38650263100863),
              LatLng(23.825816912074206, 90.38566075265408),
              LatLng(23.8265496238022, 90.38583241403103),
              LatLng(23.82832939985408, 90.3871238976717),
              LatLng(23.82853120645386, 90.38867689669132),
              LatLng(23.82589634816265, 90.38781523704529),
              LatLng(23.82431865859441, 90.38803618401289),
            ],
            fillColor: Colors.blueGrey,
            strokeWidth: 4,
            strokeColor: Colors.red,
            consumeTapEvents: true,
            visible: true
          ),
          Polygon(polygonId: PolygonId('second polygone'),
            points: [
              LatLng(23.814763473650913, 90.38974843919277),
              LatLng(23.813896040403318, 90.39519265294075),
              LatLng(23.816887249679702, 90.39468571543694),
              LatLng(23.816573163675343, 90.39009176194668),
              LatLng(23.81633391796678, 90.38922540843487),
              LatLng(23.817829503132796, 90.38966663181782)
            ],
            fillColor: Colors.greenAccent,
            strokeColor: Colors.red,
            strokeWidth: 5,
              consumeTapEvents: true,
              visible: true
          )
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // _mapController.moveCamera(CameraUpdate.newCameraPosition(
              //   CameraPosition(
              //     target: const LatLng(23.826741729120208, 90.38760308214225),
              //     zoom: 16,
              //   ),
              // ));
              _mapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: const LatLng(23.826741729120208, 90.38760308214225),
                  zoom: 16,
                ),
              ));
            },
            child: Icon(
              Icons.my_location,
              color: Colors.blue,
            ),
            backgroundColor: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}

