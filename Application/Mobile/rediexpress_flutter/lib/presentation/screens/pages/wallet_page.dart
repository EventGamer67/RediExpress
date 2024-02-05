import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/profile_page/profile_info_block.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/wallet_page/wallet_topup_block.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        centerTitle: true,
        title: Text(
          "Wallet",
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 167, 167, 167)),
        ),
      ),
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  ProfileInfoBlock(),
                  SizedBox(
                    height: 12,
                  ),
                  Wallet_TopUp_block(),
                  SizedBox(
                    height: 41,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Transaction History",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 20,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 1,
                                                  spreadRadius: 1,
                                                  offset: const Offset(0, 1))
                                            ])),
                                  );
                                })),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
