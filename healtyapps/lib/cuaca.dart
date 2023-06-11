import 'package:flutter/material.dart';
import 'package:healtyapps/models/data_service.dart';
import 'package:healtyapps/models/weather.dart';
import 'package:http/http.dart';

class Cuaca extends StatefulWidget {
  const Cuaca({super.key});

  @override
  State<Cuaca> createState() => _CuacaState();
}

class _CuacaState extends State<Cuaca> {
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Weather weather = Weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffABA6E8),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Color(0xfffffffff),
        body: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        isFetch
                            ? Column(children: [
                                Image.network(
                                    'https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                                Text(
                                  "${weather.temp}",
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                                Text(
                                  '${weather.description}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              ])
                            : SizedBox(),
                        Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: TextField(
                            controller: controller,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(labelText: "City"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20, top: 50),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xff7F78D2)),
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                isFetch = true;
                                weather = await dataService
                                    .fetchData(controller.text);
                                setState(() {});
                              },
                              child: const Center(
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // ElevatedButton(
                        //     onPressed: () async {
                        //       isFetch = true;
                        //       weather =
                        //           await dataService.fetchData(controller.text);
                        //       setState(() {});
                        //     },
                        //     child: Text("Search"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
