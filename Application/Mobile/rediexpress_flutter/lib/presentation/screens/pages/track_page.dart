import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 320,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(51.509364, -0.128928),
                initialZoom: 0.2,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(polylines: [
                  Polyline(
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                      strokeJoin: StrokeJoin.round,
                      color: Theme.of(context).colorScheme.primary,
                      points: [
                        LatLng(51.509364, -0.128928),
                        LatLng(53.509364, -1.128928),
                        LatLng(53.509364, 1.18928),
                        LatLng(52.509364, 1.38928),
                        LatLng(54.509364, -0.128928)
                      ])
                ]),
                MarkerLayer(markers: [
                  Marker(
                      point: LatLng(51.509364, -0.128928),
                      child: Icon(
                        Icons.map,
                        color: Colors.red,
                      )),
                  Marker(
                      point: LatLng(54.509364, -0.128928),
                      child: Icon(Icons.map, color: Colors.red))
                ])
                // PolygonLayer(polygons: [
                //   Polygon(
                //       color: Colors.red.withOpacity(0.2),
                //       borderStrokeWidth: 2,
                //       isFilled: true,
                //       borderColor: Colors.red,
                //       points: [
                //         LatLng(51.509364, -0.128928),
                //         LatLng(53.509364, -1.128928),
                //         LatLng(54.509364, -0.128928)
                //       ])
                // ]),
              ],
            ),
          ),
          SizedBox(
            height: 36,
          ),
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tracking number",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg/icons/vuesax_linear_sun.svg"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Tracking number",
                          style: GoogleFonts.roboto(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Package Status",
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Container(
                      child: Stepper(
                        margin: EdgeInsets.only(left: 0),
                        onStepTapped: (value) {},
                        currentStep: 0,
                        physics: NeverScrollableScrollPhysics(),
                        controlsBuilder: (context, details) {
                          return SizedBox(
                            width: double.infinity,
                            height: 0,
                          );
                        },
                        
                        steps: [
                          Step(
                              title: Text("Courier requested"),
                              content: SizedBox(
                                height: 0,
                                width: 1,
                              ),
                              isActive: true),
                          Step(
                              title: Text("test"),
                              content: SizedBox(
                                height: 1,
                                width: 1,
                              ),
                              isActive: true),
                          Step(
                              title: Text("test"),
                              content: Text("test"),
                              isActive: true)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
