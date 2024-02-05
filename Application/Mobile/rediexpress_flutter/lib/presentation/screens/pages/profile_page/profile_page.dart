// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/Data/profile/profile_list_data.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/add_payment_method.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/notification_page.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/profile_page/profile_list_tile.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/profile_page/toggletheme_switch.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/profile_page/profile_info_block.dart';

import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool isDarkTheme;
  
  List<ProfileListTileData> datatiles = [
    ProfileListTileData(
        title: "Edit profile",
        subString: "Name, phone no, address, email ...",
        image: "assets/svg/vuesax/profileTileIcons/Group.svg",
        onTap: (context) {}),
    ProfileListTileData(
        title: "Statements & Reports",
        subString: "Download transaction details, orders, deliveries",
        image: "assets/svg/vuesax/profileTileIcons/Group-1.svg",
        onTap: (context) {}),
    ProfileListTileData(
        title: "Notification Settings",
        subString: "mute, unmute, set location & tracking setting",
        image: "assets/svg/vuesax/profileTileIcons/notification.svg",
        onTap: (context) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NotificationPage()));
        }),
    ProfileListTileData(
        title: "Card & Bank account settings",
        subString: "change cards, delete card details",
        image: "assets/svg/vuesax/profileTileIcons/wallet-2.svg",
        onTap: (context) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PaymentPage()));
        }),
    ProfileListTileData(
        title: "Referrals",
        subString: "check no of friends and earn",
        image: "assets/svg/vuesax/profileTileIcons/carbon_two-person-lift.svg",
        onTap: (context) {}),
    ProfileListTileData(
        title: "About Us",
        subString: "know more about us, terms and conditions",
        image: "assets/svg/vuesax/profileTileIcons/map.svg",
        onTap: (context) {}),
  ];

  @override
  void initState() {
    // TODO: implement initState
    isDarkTheme = false;
    super.initState();
  }

  void switchTheme(bool toggle) {
    setState(() {
      isDarkTheme = toggle;
      Provider.of<ThemeProvider>(context, listen: false).switchTheme();
    });
  }

  void logout() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
              fontSize: 16,
              color: Color.fromARGB(255, 167, 167, 167),
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const ProfileInfoBlock(),
              const SizedBox(
                height: 20,
              ),
              ToggleSwitchTheme(
                  switchTheme: switchTheme, isDarkTheme: isDarkTheme),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(datatiles.length + 1, (index) {
                  if (index != datatiles.length) {
                    return ProfileListTile(data: datatiles[index]);
                  } else {
                    return ProfileListTileLogout(
                      logout: logout,
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListTileLogout extends StatelessWidget {
  final Function logout;
  const ProfileListTileLogout({super.key, required this.logout});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          logout.call();
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(0, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/svg/vuesax/profileTileIcons/ic_round-log-out.svg",
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log out",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
                SvgPicture.asset(
                  "assets/svg/Vector.svg",
                  color: Theme.of(context).colorScheme.inverseSurface,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

