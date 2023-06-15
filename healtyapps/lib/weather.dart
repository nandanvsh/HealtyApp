import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healtyapps/models/weather_model.dart';
import 'package:healtyapps/service/api.dart';
import 'package:healtyapps/service/state_manager.dart';
import 'package:healtyapps/utils/setting.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  Weather({super.key});
  // CuacaApi cuacaApi = CuacaApi();

  // Future<WeatherModel>? getData(double lat, double lon) async {
  //   // mendapatkan lonlang di gps trs di simpan di var long  lat
  //   return await cuacaApi.panggilCuaca();
  // }

  @override
  Widget build(BuildContext context) {
    AppBar();
    final f = new DateFormat('EEEE dd,MMM', "id_ID");
    return Scaffold(
      body: FutureBuilder<WeatherModel>(
        future: panggilCuaca(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final WeatherModel data = snapshot.data!;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: setGradient(data.data.current.weather.ic),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height / 9,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(
                        //   padding:
                        //       EdgeInsets.only(top: 100, left: 20, right: 20),
                        //   child: TextField(
                        //     // onChanged: (value) => controller.city = value,
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //     textInputAction: TextInputAction.search,
                        //     // onSubmitted: (value) => controller.updateWeather(),
                        //     decoration: InputDecoration(
                        //       suffix: Icon(
                        //         Icons.search,
                        //         color: Colors.white,
                        //       ),
                        //       hintStyle: TextStyle(color: Colors.white),
                        //       hintText: 'Search'.toUpperCase(),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(color: Colors.white),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(color: Colors.white),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(color: Colors.white),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          data.data.city,
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          f.format(data.data.current.weather.ts),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            setImage(data.data.current.weather.ic),
                            scale: 1.5,
                          ),
                        ),
                        Text(
                          '${data.data.current.weather.tp} \u2103',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          setWeather(data.data.current.weather.ic),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.25,
                    minChildSize: 0.12,
                    expand: true,
                    builder: (BuildContext c, s) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          controller: s,
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 8,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: setColor(
                                    data.data.current.pollution.mainus),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: setColorDark(
                                            data.data.current.pollution.mainus),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      width: 80.0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Index AQI',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            '${data.data.current.pollution.aqius}',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Kualitas Udara'),
                                      Text(
                                        setAqi(
                                            data.data.current.pollution.aqius),
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ListTile(
                                title: Text('Kelembapan'),
                                trailing:
                                    Text('${data.data.current.weather.hu}%')),
                            ListTile(
                                title: Text('Angin'),
                                trailing:
                                    Text('${data.data.current.weather.ws}m/s')),
                            ListTile(
                                title: Text('Tekanan'),
                                trailing:
                                    Text('${data.data.current.weather.pr}mb')),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
