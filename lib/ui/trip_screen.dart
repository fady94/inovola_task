import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:inovola_task/models/Trip.dart';

class TripScreen extends StatefulWidget {
  final Trip trip;
  TripScreen(this.trip);

  @override
  _TripScreenState createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  var trip;
  List<dynamic> sliderImages = List<dynamic>();
  List<Widget> reserveList = List<Widget>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var greyColor = Color(0xff8a8d9e);
    trip = widget.trip;
    trip.img.forEach((img) {
      sliderImages.add(Image.network(
        img,
        fit: BoxFit.fill,
      ));
    });
    var trainerImg = trip.trainerImg.toString().replaceAll("https", "http");
    trip.reserveTypes.forEach((type) {
      //We will add the reserve type if the count larger than 0
      if (type.count > 0) {
        reserveList.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Text(type.name)),
            Expanded(
                child: Text(
              type.price + " SAR",
              textAlign: TextAlign.left,
            )),
          ],
        ));
      }
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: (height * 0.25),
                child: Carousel(
                  images: sliderImages,
                  dotSize: 6.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.white.withOpacity(0.5),
                  dotPosition: DotPosition.bottomLeft,
                  dotBgColor: Colors.transparent,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "# " + trip.interest,
                              style: TextStyle(color: greyColor),
                            ),
                            Text(
                              trip.title,
                              style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    width: 30.0,
                                    child: Icon(
                                      Icons.calendar_today,
                                      size: 18.0,
                                      color: greyColor,
                                    )),
                                Text(trip.arabicDate,
                                    style: TextStyle(color: greyColor)),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    width: 30.0,
                                    child: Icon(
                                      Icons.location_on,
                                      size: 20.0,
                                      color: greyColor,
                                    )),
                                Text(trip.address,
                                    style: TextStyle(color: greyColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(height: 0.5, color: greyColor),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(
                                              trainerImg,
                                            )))),
                                SizedBox(width: 10.0),
                                Text(trip.trainerName,
                                    style: TextStyle(color: greyColor)),
                              ],
                            ),
                            Text(
                              trip.trainerInfo,
                              style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 0.5, color: greyColor),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("عن الدورة",
                                style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.0)),
                            SizedBox(height: 3.0),
                            Text(
                              trip.occasionDetail,
                              style: TextStyle(
                                  color: greyColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 0.5, color: greyColor),
                      Container(
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("تكلفة الدورة",
                                style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.0)),
                            SizedBox(height: 3.0),
                            Column(children: reserveList),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {},
                  color: Color(0xff723183),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "قم بالحجز الأن",
                      style: TextStyle(
                          letterSpacing: 4.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
