// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/sendapackage_screen/sendapackage_receip_screen.dart';

class DestintionDetails {
  String adress = "";
  String state = "";
  String phone = "";
  String others = "";

  DestintionDetails();

  factory DestintionDetails.fromData(adress, others, phone, state) {
    DestintionDetails dat = DestintionDetails();
    dat.adress = adress;
    dat.others = others;
    dat.phone = phone;
    dat.state = state;
    return dat;
  }
}

class SendAPackageScreen extends StatefulWidget {
  const SendAPackageScreen({super.key});

  @override
  State<SendAPackageScreen> createState() => _SendAPackageScreenState();
}

class _SendAPackageScreenState extends State<SendAPackageScreen> {
  late List<DestintionDetails> details;

  _addnew() {
    details.add(DestintionDetails());
    setState(() {});
  }

  _onInstant(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SendAPackageReceipScreen(details: this.details);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    details = [DestintionDetails()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            width: 24,
            height: 24,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  "assets/svg/arrow-square-right.svg",
                )),
          ),
        ),
        title: Text(
          "Send a package",
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 167, 167, 167)),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 43,
              ),
              OriginDetailsBlock(),
              const SizedBox(
                height: 40,
              ),
              Column(
                  children: List.generate(details.length, (index) {
                return Column(
                  children: [
                    index != 0
                        ? (SizedBox(
                            height: 11,
                          ))
                        : SizedBox(),
                    DestinationDetailsBlock(),
                  ],
                );
              }).toList()),
              const SizedBox(
                height: 11,
              ),
              AddDestionationBlock(
                addnew: _addnew,
              ),
              const SizedBox(
                height: 13,
              ),
              PackageDetailsBlock(),
              const SizedBox(
                height: 39,
              ),
              SelectDeliveryTypeBlock(
                onInstant: _onInstant,
              ),
              SizedBox(
                height: 9,
              )
            ],
          ),
        ),
      )),
    );
  }
}

class AddDestionationBlock extends StatelessWidget {
  final Function addnew;
  const AddDestionationBlock({super.key, required this.addnew});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => addnew.call(),
      child: Container(
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/svg/vuesax/linear/add-square.svg",
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "Add destination",
              style: GoogleFonts.roboto(
                  color: Color.fromARGB(255, 167, 167, 167),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class SelectDeliveryTypeBlock extends StatelessWidget {
  final Function(dynamic) onInstant;
  const SelectDeliveryTypeBlock({super.key, required this.onInstant});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select delivery type",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    onInstant.call(context);
                  },
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0, 1.3))
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/icons/clock.svg",
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Instant delivery",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(0, 1.3))
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/icons/Vector (2).svg",
                          width: 24,
                          height: 24,
                          color: Color.fromARGB(255, 167, 167, 167),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Scheduled delivery",
                          style: GoogleFonts.roboto(
                              color: Color.fromARGB(255, 167, 167, 167),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PackageDetailsBlock extends StatelessWidget {
  const PackageDetailsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Destination Details",
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inverseSurface),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "package item",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Weight of item(kg)",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Worth of items",
            controller: null,
          ),
        ],
      ),
    );
  }
}

class DestinationDetailsBlock extends StatelessWidget {
  const DestinationDetailsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/svg/icons/Vector (1).svg"),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Destination Details",
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inverseSurface),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Address",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "State, Country",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Phone number",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Others",
            controller: null,
          ),
        ],
      ),
    );
  }
}

class OriginDetailsBlock extends StatelessWidget {
  const OriginDetailsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/svg/icons/Vector.svg"),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Origin Details",
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inverseSurface),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Address",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "State, Country",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Phone number",
            controller: null,
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomtextField(
            hinttext: "Others",
            controller: null,
          ),
        ],
      ),
    );
  }
}

class CustomtextField extends StatelessWidget {
  final String hinttext;
  final TextEditingController? controller;

  const CustomtextField(
      {super.key, required this.hinttext, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1.3))
          ]),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(8, 7, 0, 9),
        child: TextField(
          controller: controller,
          decoration: InputDecoration.collapsed(
              hintText: hinttext,
              hintStyle: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 207, 207, 207),
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
