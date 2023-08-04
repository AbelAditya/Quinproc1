import 'package:flutter/material.dart';
import 'package:quinproc/BeatTile.dart';

class Home extends StatefulWidget {
  late final String Name;
  late final String Uid;

  Home({required String this.Name,required String this.Uid});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Color(0xFFFBDED5),
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 3, blurRadius: 3)
              ],
              color: Color(0xFFFBDED5),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0))),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0,top: 8.0),
                      child: Image(
                        image: AssetImage("images/logo.png"),
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only( right: 15.0),
                      child: Text(
                        "Maatrtv",
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(TextSpan(
                          text: "Welcome back\n",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 30.0),
                          children: <InlineSpan>[
                            TextSpan(
                                text: widget.Name,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF646262)))
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, bottom: 8.0, right: 20.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Text(
                          "${widget.Name.split(" ")[0][0]}${widget.Name.split(" ")[widget.Name.split(" ").length - 1][0]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0),
                        ),
                        radius: 40.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          beatTile(Uid: widget.Uid,),
        ],
      ),
    );
  }
}
