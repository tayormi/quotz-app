import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quotz/viewmodels/quote_vm.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final quoteVm = useProvider(quoteProvider);
    return Scaffold(
        backgroundColor: Color(0xFF004e92),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(30),
                height: height,
                width: width,
                child: quoteVm.loading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "\"",
                            style: GoogleFonts.aclonica(
                                color: Colors.white, fontSize: 80),
                          ),
                          Text(
                            "${quoteVm.quote.quote} ?? " "",
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "- ${quoteVm.quote.author}",
                            style: GoogleFonts.playfairDisplay(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox.fromSize(
                                size: Size(56, 56), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.green, // splash color
                                      onTap: () =>
                                          quoteVm.getQuotes(), // button pressed
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.refresh,
                                            color: Color(0xFF004e92),
                                          ), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ))));
  }
}
