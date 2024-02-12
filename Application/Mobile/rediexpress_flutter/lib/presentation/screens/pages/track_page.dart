import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:rediexpress_flutter/presentation/screens/sendapackage_screen/sendapackage_receip_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';

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
          const CustomMap(),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Tracking number",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg/icons/vuesax_linear_sun.svg"),
                        const SizedBox(
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
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Package Status",
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 167, 167, 167),
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const CustomStepper(),
                    const SizedBox(
                      height: 40,
                    ),
                    MyButtonFilled(
                        enabled: true,
                        onClick: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SendAPackageReceipScreen(
                              code: "",
                              details: [],
                            );
                          }));
                        },
                        width: double.infinity,
                        height: 46,
                        fontSize: 16,
                        text: "View Package Info")
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

class CustomMap extends StatelessWidget {
  const CustomMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(51.509364, -0.128928),
          initialZoom: 1.0,
        ),
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.grey.shade50.withOpacity(1), BlendMode.saturation),
            child: TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ),
          PolylineLayer(polylines: [
            Polyline(
                strokeWidth: 10,
                strokeCap: StrokeCap.round,
                strokeJoin: StrokeJoin.round,
                color: Theme.of(context).colorScheme.primary,
                points: [
                  const LatLng(51.509364, -0.128928),
                  const LatLng(53.509364, -1.128928),
                  const LatLng(53.509364, 1.18928),
                  const LatLng(52.509364, 1.38928),
                  const LatLng(54.509364, -0.128928)
                ])
          ]),
          const MarkerLayer(markers: [
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
        ],
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(
            4,
            (index) => Container(
                  height: 48,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 14,
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/svg/Checkbox.svg"),
                            Container(
                              width: 1,
                              height: 34,
                              color: index != 3
                                  ? const Color(0xFFA7A7A7)
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Courier requested",
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                "July 7 2022",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xFFEC8000)),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "10:30am",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xFFEC8000)),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
