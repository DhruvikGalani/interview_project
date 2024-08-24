import 'package:flutter/material.dart';
import 'package:interview_project/HomeScreen.dart';
import 'package:interview_project/variable.dart';

class SecondPage extends StatefulWidget {
  int? ind;
  SecondPage({super.key, required this.ind});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                "${ApiList[widget.ind!]['image']}",
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Home_page(),
                            transitionDuration:
                                const Duration(milliseconds: 100),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert),
                      onSelected: (String value) {},
                      itemBuilder: (BuildContext context) {
                        return {'Light', 'Dark'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${ApiList[widget.ind!]["title"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 24),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "price",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                                Text(
                                  "\$${ApiList[widget.ind!]['price']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 50, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.fullscreen,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.all(10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("color"),
                                      Flexible(
                                        child: VerticalDivider(
                                          color: Colors.grey.shade700,
                                          width: 3,
                                          endIndent: 3,
                                        ),
                                      ),
                                      container(Color(0xff867050)),
                                      container(Color(0xff774C08)),
                                      container(Color(0xff1b5209)),
                                      container(Colors.white),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "${ApiList[widget.ind!]['description']}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          height: 80,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Color(0xff090D2F),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Shop Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget container(Color color) {
    return Container(
      height: 25,
      width: 25,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
