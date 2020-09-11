import 'package:flutter/material.dart';
import 'package:flutter_app/model/planet_info.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 44,
                          color:  Color(0xffffffff),
                          fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      hint: Text("Select Your Friends"),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 24,
                              color: Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Image.asset('assets/drop_down_icon.png'),
                      ),
                      underline: SizedBox(),
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                child: Swiper(
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 18,
                      space: 8
                    )
                  ) ,
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 100,),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 100,),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 32,
                                        color: Color(0xff47455f),
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff47455f),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        Text(
                                          'Know More',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: Color(0xffe4979e),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(Icons.arrow_forward)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Image.asset(planets[index].iconImage)
                      ],
                    );
                  },
                ),
              )
            ]
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            IconButton()
          ],
        ),
      ),
    );
  }
}
